require_relative 'flower_bundler/version'
require_relative 'flower_bundler/flower'
require_relative 'flower_bundler/flower_bundle'
require_relative 'flower_bundler/catalogue'
require_relative 'flower_bundler/order'

module FlowerBundler

  def self.process_order(order)
    raise ArgumentError, 'Missing order information' if order.nil? or order.empty?
    total_price = 0
    result = []
    order.lines.map(&:chomp).each do |an_order|
      order = Order.parse an_order
      bundles = order.process
      result << {
        request: an_order,
        total:   bundles.inject(0) { |n, bundle| bundle[:count] * bundle[:price] + n },
        bundles: bundles
      }
    end
    result
  end

end
