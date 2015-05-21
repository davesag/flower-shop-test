module FlowerBundler

  # When a customer order has been processed the system will respond
  # with an collection of order result that indicate
  # which bundles of flowers are to be shipped.
  class OrderResult
    attr_accessor :count, :size, :price

    def initialize(bundle)
      @count = 1
      @size = bundle.amount
      @price = bundle.price
    end

    def increment
      @count += 1
    end

    def ==(another_result)
      return false unless @count == another_result.count
      return false unless @size  == another_result.size
      return false unless @price == another_result.price
      true
    end

  end
end
