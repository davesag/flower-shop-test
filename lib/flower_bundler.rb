require_relative 'flower_bundler/flower'
require_relative 'flower_bundler/flower_bundle'
require_relative 'flower_bundler/catalogue'
require_relative 'flower_bundler/order'

# The FlowerBundler module provides the top-level interface to the
# order processing and flower bundle selection system
#
# To Use first construct an order string in the form
#   some_order_text = %q(10 R12
#                        15 L09
#                        13 T58)
# then call
#   FlowerBundler.process_order(some_order_text)
# It will return an array of results.
module FlowerBundler
  class << self
    def process_order(order_text)
      fail ArgumentError, 'Missing order information' if order_text.nil? || order_text.empty?
      result = []
      order_text.lines.map(&:chomp).each do |an_order|
        order = Order.parse an_order
        bundles = order.process
        result << build_result(order: an_order, bundles: bundles)
      end
      result
    end

    private

    def build_result(order:, bundles:)
      {
        request: order,
        total:   bundles.inject(0) { |a, e| e[:count] * e[:price] + a },
        bundles: bundles
      }
    end
  end
end
