module FlowerBundler

  # When a customer order has been processed the system will respond
  # with an collection of order result that indicate
  # which bundles of flowers are to be shipped.
  class OrderResult
    attr_accessor :count, :size, :price

    def initialize(count:, bundle:)
      @count = count
      @size = bundle.amount
      @price = bundle.price
    end

    def increment
      @count += 1
    end

    def ==(other)
      return false unless @size == other.size
      return false unless @count == other.count
      return false unless @price == other.price
      true
    end

  end
end
