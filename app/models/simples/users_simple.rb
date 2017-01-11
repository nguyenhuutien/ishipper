class Simples::UsersSimple < Simples::UserSimple
  def simple
    simples = Array.new
    @object.each do |object|
      user_simple = Simples::UserSimple.new object: object
      simples << user_simple.simple
    end
    simples
  end
end
