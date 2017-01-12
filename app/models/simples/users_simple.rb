class Simples::UsersSimple < Simples::UserSimple
  def simple
    superclass = @object.class.superclass
    if superclass == ActiveRecord::Relation || superclass.superclass == ActiveRecord::Relation
      simples = Array.new
      @object.each do |object|
        user_simple = Simples::UserSimple.new object: object
        simples << user_simple.simple
      end
      simples
    else
      user_simple = Simples::UserSimple.new object: @object
      user_simple.simple
    end
  end
end
