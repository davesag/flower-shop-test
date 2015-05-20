module FlowerBundler
  class Order
    attr_accessor :count, :code

    def initialize(count:, code:)
      @count = count.to_i
      @code = code
    end

    def process
      # work out the best bundles
      # return result
    end

    def self.parse(order_line)
      order = order_line.split(' ')
      Order.new count: order[0], code: order[1]
    end
  end
end
