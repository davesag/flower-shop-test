module FlowerBundler

  # When a customer order has been processed the system will respond
  # with an collection of order result that indicate
  # which bundles of flowers are to be shipped.
  class OrderResult
    attr_reader :count, :size, :price

    def initialize(count:, bundle:)
      @count = count
      @size = bundle.size.freeze
      @price = bundle.price.freeze
    end

    def decrement_count
      fail BundleError if count == 1
      @count -= 1
    end

  end
end
