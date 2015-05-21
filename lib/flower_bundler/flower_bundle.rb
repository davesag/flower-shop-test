module FlowerBundler

  # Flowers are sold in discreet bundles.
  # A FlowerBundle is a simple container that describes
  # the amount of flowers in the bundle, and the price of the bundle.
  class FlowerBundle
    attr_accessor :amount, :price

    def initialize(amount:, price:)
      @amount = amount
      @price = price
    end
  end
end
