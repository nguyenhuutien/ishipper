class CheckInvoiceMapMarker
  include Math

  def initialize invoice
    @invoice = invoice
  end

  def perform
    error = ""
    ["start", "finish"].each do |location|
      ["latitude", "longitude"].each do |coordinates|
        if @invoice.send("#{coordinates}_#{location}").nil?
          error += "#{coordinates}_#{location} ".humanize + I18n.t("invoices.cannot_blank")
        end
      end
    end

    unless @invoice.distance_invoice.present? && check_distance_invoice
      error += Settings.invoice.invoice_attributes_info.last.humanize + " " + I18n.t("invoices.invalid")
    end

    error
  end

  private
  def rad x
    x * Math::PI / Settings.degree
  end

  def getDistance
    r = Settings.earth_radius
    dLat = rad(@invoice.latitude_finish - @invoice.latitude_start)
    dLong = rad(@invoice.longitude_finish - @invoice.longitude_start)
    a = Math.sin(dLat / Settings.constant_2) * Math.sin(dLat / Settings.constant_2) +
      Math.cos(rad(@invoice.latitude_start)) * Math.cos(rad(@invoice.latitude_finish)) *
      Math.sin(dLong / Settings.constant_2) * Math.sin(dLong / Settings.constant_2);
    c = Settings.constant_2 * Math.atan2(Math.sqrt(a), Math.sqrt(Settings.constant_1 - a))
    d = r * c
    d / Settings.constant_1000
  end

  def check_distance_invoice?
    distance_check = getDistance
    (@invoice.distance_invoice > getDistance - Settings.invoice.epsilon_distance) &&
      (@invoice.distance_invoice < getDistance + Settings.invoice.epsilon_distance)
  end
end
