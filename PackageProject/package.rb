class Package
  attr_reader :products, :tags, :stamps

  def initialize
    @products = []
    @tags = []
    @stamps = []
  end

  def add_products
    @products << {
      info: product,
      quantity: quantity
    }
  end

  ["tag", "stamp"].each do |i| # i = item
    define_method "add_#{i}" do |v| # v = value
      instance_variable = self.send("#{item}s")
      instance_variable.send("<<", v)
    end
  end    
end