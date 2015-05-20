require_relative 'flower_bundler/version'
require_relative 'flower_bundler/flower'
require_relative 'flower_bundler/flower_bundle'
require_relative 'flower_bundler/order'

module FlowerBundler

  def self.process_order(order)
    raise ArgumentError, 'Missing order information' if order.nil? or order.empty?
    total_price = 0
    order.lines.map(&:chomp).each do |an_order|
      order = Order.parse an_order
      order.process
      # sum the results
    end
    # return the report
  end

end
