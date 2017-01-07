class Simples::InvoicesSimple < Simples::InvoiceSimple
  def simple
    superclass = @object.class.superclass
    if superclass == ActiveRecord::Relation || superclass.superclass == ActiveRecord::Relation
      simples = Array.new
      @object.includes(:shop, user: [:user_setting]).each do |object|
        invoice_simple = Simples::InvoiceSimple.new object: object
        simples << invoice_simple.simple
      end
      simples
    else
      invoice_simple = Simples::InvoiceSimple.new object: @object
      invoice_simple.simple
    end
  end
end
