module FlowerBundler
  class FlowerBundle
    attr_accessor :amount, :price

    def initialize(amount:, price:)
      @amount = amount
      @price = price
    end
  end
end
