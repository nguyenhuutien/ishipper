class Simples::StatusInvoiceHistoriesSimple < Simples::StatusInvoiceHistorySimple
  def simple
    superclass = @object.class.superclass
    if superclass == ActiveRecord::Relation || superclass.superclass == ActiveRecord::Relation
      simples = Array.new
      @object.each do |object|
        status_history = Simples::StatusInvoiceHistorySimple.new object: object
        simples << status_history.simple
      end
      simples
    else
      status_history = Simples::StatusInvoiceHistorySimple.new object: @object
      status_history.simple
    end
  end
end
