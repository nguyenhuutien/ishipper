class Supports::ShipperIndex
  attr_accessor :load_more, :total_pages

  def initialize params, total_pages
    @load_more = params[:load_more] ||= nil
    @total_pages = total_pages
  end
end
