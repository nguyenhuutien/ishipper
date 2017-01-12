class Simples::BaseSimple
  def initialize args
    @object = args[:object]
    scope = args[:scope]
    @simple = Hash.new

    if scope
      scope.each do |key, value|
        instance_variable_set "@#{key}", value
      end
    end
  end

  def simple
    self.attributes.each do |attribute|
      instance_variable_set "@#{attribute}", @object.try(attribute)
    end
    self.attributes.each do |method|
      @simple[method.to_sym] = self.send method
    end
    @simple
  end

  def attributes
    attributes = self.class.attributes
    if self.class.superclass != Simples::BaseSimple
      attributes += self.class.superclass.attributes
    end
    attributes
  end

  class << self
    def attr_accessor *vars
      @attributes ||= []
      @attributes.concat vars
      super *vars
    end

    def attributes
      @attributes
    end
  end
end
