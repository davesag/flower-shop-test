require_relative 'flower_bundler/flower'
require_relative 'flower_bundler/flower_bundle'
require_relative 'flower_bundler/catalogue'
require_relative 'flower_bundler/order'
require_relative 'flower_bundler/order_result'
require_relative 'flower_bundler/receipt'

# The FlowerBundler module provides the top-level interface to the
# order processing and flower bundle selection system
#
# To Use first construct an order string in the form
#   some_order_text = %q(10 R12
#                        15 L09
#                        13 T58)
# then call
#   FlowerBundler.process_order(some_order_text)
# It will return an array of receipts, one for each order.
module FlowerBundler

  class UnknownFlowerError < ArgumentError; end
  class BundleError < ArgumentError; end

  class << self
    def process_order(order_text)
      fail ArgumentError, 'Missing order information' if order_text.nil? || order_text.empty?
      order_text.lines.map(&:chomp).map do |an_order|
        order = Order.parse an_order
        Receipt.new(request: an_order, results: order.process)
      end
    end
  end
end
