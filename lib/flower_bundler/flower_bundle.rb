module FlowerBundler

  # Flowers are sold in discreet bundles.
  # A FlowerBundle is a simple container that describes
  # the number of flowers in the bundle, (i.e. it's size)
  # and the price of the bundle in an integer number of cents.
  class FlowerBundle
    attr_accessor :size, :price

    def initialize(size:, price:)
      @size = size
      @price = price
    end
  end
end
