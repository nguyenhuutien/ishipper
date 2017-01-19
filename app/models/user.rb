class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :recoverable, :confirmable,
    :rememberable, :trackable, :validatable, :registerable

  VALID_PHONE_REGEX = /\+84\d{9,10}\)*\z/

  after_create :create_usersetting

  has_one :user_setting, dependent: :destroy

  has_many :active_reviews, class_name: Review.name, foreign_key: "owner_id",
    dependent: :destroy
  has_many :passive_reviews, class_name: Review.name, foreign_key: "recipient_id",
    dependent: :destroy
  has_many :active_notifications, class_name: Notification.name,
    foreign_key: "owner_id", dependent: :destroy
  has_many :passive_notifications, class_name: Notification.name,
    foreign_key: "recipient_id", dependent: :destroy
  has_many :owner_black_lists, class_name: BlackList.name,
    foreign_key: "owner_id", dependent: :destroy
  has_many :black_list_users, through: :owner_black_lists, source: :black_list_user
  has_many :owner_favorite_lists, class_name: FavoriteList.name,
    foreign_key: "owner_id", dependent: :destroy
  has_many :favorite_list_users, through: :owner_favorite_lists, source: :favorite_list_user
  has_many :passive_favorite_lists, class_name: FavoriteList.name,
    foreign_key: "favorite_list_user_id", dependent: :destroy
  has_many :passive_favorites, through: :passive_favorite_lists, source: :owner
  has_many :user_tokens, dependent: :destroy

  enum status: [:unactive, :actived, :block_temporary, :blocked]

  scope :search_user, -> role, data {where("role = ? AND (phone_number = ? OR
    name LIKE ?)", role, data, "%#{data}%")}
  scope :shipper, -> {where role: "Shipper"}
  scope :shop, -> {where role: "Shop"}
  scope :order_by_time, -> {order created_at: :desc}
  scope :sort_by_report_desc, -> {left_joins(:passive_reviews)
    .where("reviews.id IS NULL OR reviews.created_at >= ? AND reviews.review_type = ?",
    Time.zone.now - 1.day, Review.review_types[:report]).group(:id)
    .order 'COUNT(reviews.id) DESC'}
  scope :users_by_user_setting, -> user_settings {where id: user_settings.pluck(:user_id)}
  ATTRIBUTES_PARAMS = [:phone_number, :name, :email, :address, :plate_number,
    :role, :password, :password_confirmation, :avatar]

  UPDATE_ATTRIBUTES_PARAMS = [:name, :email, :address, :plate_number,
    :password, :password_confirmation, :current_password, :avatar]

  validates :phone_number, uniqueness: true,
    format: {with: VALID_PHONE_REGEX}
  # validates :plate_number, uniqueness: true,
  #   length: {minimum: 8, maximum: 10}, allow_nil: true

  self.inheritance_column = :_type_disabled
  self.inheritance_column = :role

  class << self
    def search_shipper q
      query = q[:type] ? "LOWER(#{q[:type]}) LIKE LOWER('%#{q[:data]}%')" : ""
      shippers = self.where query
      shippers = shippers.order("#{q[:attribute]}".to_sym => "#{q[:sortable]}".to_sym) if q[:attribute]
      shippers.empty? ? self.all : shippers
    end

    def users_token
      UserToken.where user_id: self.ids
    end

    def users_online
      self.where id: self.users_token.select{|user_token| user_token.user_id if user_token.online?}
    end
  end

  def email_required?
    false
  end

  def confirmation_required?
    false
  end

  def send_pin
    twilio_client = Twilio::REST::Client
      .new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
    if self.valid_phone_number?
      begin
        # pin = SecureRandom.urlsafe_base64[0..7]
        pin = "12345678"
        self.update_attributes pin: pin
        # twilio_client.messages.create to: "#{self.phone_number}",
        #   from: "#{Settings.from_phone_number}", body: I18n.t("your_pin", pin: pin)
        rescue => e
        return false
        true
      end
    else
      false
    end
  end

  def current_user? user
    self == user
  end

  def activate
    self.actived!
    self.pin = nil
    return self.save
  end

  def reset_password params={}
    check = if check_pin params[:pin]
      self.password = params[:password]
      self.password_confirmation = params[:password_confirmation]
      self.pin = nil
      self.save
    else
      false
    end
    check
  end

  def check_pin pin
    return self.pin == pin unless self.pin.nil?
  end

  def valid_phone_number?
    lookup_client = Twilio::REST::LookupsClient
      .new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
    begin
      response = lookup_client.phone_numbers.get self.phone_number
      response.phone_number
      rescue => e
      return false
    end
  end

  def report? invoice
    active_reviews.report.find_by invoice_id: invoice.id
  end

  def shop?
    self.role == "Shop"
  end

  def shipper?
    self.role == "Shipper"
  end

  def admin?
    self.role == "Admin"
  end

  def online?
    self.user_tokens.find_by(online: true).present?
  end

  def report? invoice
    active_reviews.report.find_by invoice_id: invoice.id
  end

  def rate? invoice
    active_reviews.rate.find_by invoice_id: invoice.id
  end

  Settings.rate.list_rate.each do |rate|
    define_method rate do
      instance_variable_set "@#{rate}", passive_reviews.
        select{|review| review.review_type == "rate" &&
        review.rating_point == Settings.rate.send(rate)}.size
      instance_variable_get "@#{rate}"
    end
  end

  def sum_rate
    sum = 0
    Settings.rate.list_rate.each do |rate|
      sum += send(rate)
    end
    sum
  end

  private
  def create_usersetting
    self.create_user_setting! current_location: self.address, role: self.role + "Setting" unless self.admin?
  end
end
