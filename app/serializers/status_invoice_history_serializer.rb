class StatusInvoiceHistorySerializer < ActiveModel::Serializer
  attributes :time, :status, :content

  def content
    I18n.t("status_history.#{object.status}")
  end
end
