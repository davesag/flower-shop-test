module FlowerBundler

  # When a customer order has been processed the system will respond
  # with an collection of order result that indicate
  # which bundles of flowers are to be shipped.
  class OrderResult
    attr_accessor :count, :size, :price

    def initialize(count:, bundle:)
      @count = count
      @size = bundle.size
      @price = bundle.price
    end

  end
end
