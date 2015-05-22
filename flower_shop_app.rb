require './lib/flower_bundler'

class FlowerShopApp
  def initialize(order)
    puts "Received order '#{order}'"
    seed
    @order = order
  end

  def process_order
    begin
      FlowerBundler.process_order(@order).each do |receipt|
        puts receipt.to_formatted
      end
    rescue FlowerBundler::BundleError => e
      puts "Error: #{e.message}"
    end
  end

  private

  def seed
    rose_bundles = [
      FlowerBundler::FlowerBundle.new(amount: 5,  price: 699),
      FlowerBundler::FlowerBundle.new(amount: 10, price: 1299)
    ]
    lily_bundles = [
      FlowerBundler::FlowerBundle.new(amount: 3, price: 995),
      FlowerBundler::FlowerBundle.new(amount: 6, price: 1695),
      FlowerBundler::FlowerBundle.new(amount: 9, price: 2495)
    ]
    tulip_bundles = [
      FlowerBundler::FlowerBundle.new(amount: 3, price: 595),
      FlowerBundler::FlowerBundle.new(amount: 5, price: 995),
      FlowerBundler::FlowerBundle.new(amount: 9, price: 1699)
    ]
    roses  = FlowerBundler::Flower.new(name: 'Roses',  code: 'R12', bundles: rose_bundles)
    lilies = FlowerBundler::Flower.new(name: 'Lilies', code: 'L09', bundles: lily_bundles)
    tulips = FlowerBundler::Flower.new(name: 'Tulips', code: 'T58', bundles: tulip_bundles)
    catalogue = FlowerBundler::Catalogue.instance
    catalogue << roses
    catalogue << lilies
    catalogue << tulips
  end
end

if __FILE__ == $0
  $stdout.sync = true
  app = FlowerShopApp.new(ARGV.join(' '))
  begin
    app.process_order
  rescue => e
    puts "Error: #{e.message}"
  end
end
