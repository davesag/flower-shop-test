module FlowerBundler

  # When a customer order has been processed the system will respond
  # with an collection of order result that indicate
  # which bundles of flowers are to be shipped.
  class OrderResult
    attr_reader :count, :size, :price

    def initialize(count:, bundle:)
      @count = count.freeze
      @size = bundle.size.freeze
      @price = bundle.price.freeze
    end

  end
end
