module FlowerBundler

  # A customer wishing to buy one or more bundles of flowers
  # will place an order, comprising the number of flowers
  # they wish to buy, and the code representing the type of flowers.
  class Order
    attr_accessor :count, :code

    def initialize(count:, code:)
      @count = count.to_i
      @code = code
    end

    def process
      flower = Catalogue.find code
      fail UnknownFlowerError, "Flower code #{code} is unknown" if flower.nil?
      flower.choose_bundles count
    end

    def self.parse(order_line)
      order_details = order_line.split(' ')
      Order.new count: order_details[0], code: order_details[1]
    end
  end
end
