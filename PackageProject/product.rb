class Product
  attr_accessor :name, :type, :price

  def initialize(name, type, price)
    @name = name
    @type = type
    @price = price
  end

  private

    def missing_method(method_name, *args)
      if method_name.to_s =~ /^set_/
        variable_name = method_name.to_s.match(/^set_(.*)/)[1]
        instance_variable_set("@#{variable_name}", args[0])
      elsif
        variable_name = method_name.to_s.match(/^get_(.*)/)[1]
        instance_variable_get("@#{variable_name}")
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      return true if method_name.to_s =~ /^set_/ || method_name.to_s =~ /^get_/
      super
    end
end