class CheckParams
  def initialize attributes_params, params
    @attributes_params = attributes_params
    @params = params
  end

  def params_exist?
    if @params.class.to_s != "ActionController::Parameters" || @params.nil?
      return false
    else
      @attributes_params.each do |attribute|
        return false unless @params.include? attribute
      end
    end
  end
end
