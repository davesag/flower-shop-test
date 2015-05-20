module FlowerBundler
  class Flower
    attr_accessor :name, :code, :bundles

    def initialize(name:, code:, bundles:)
      @name = name
      @code = code
      @bundles = bundles.sort_by { |bundle| -bundle.amount }
    end

    def choose_bundles(flower_count, some_bundles = @bundles)
      # puts "#{flower_count}, #{some_bundles}"
      raise ArgumentError, 'Not enough flowers' if flower_count < some_bundles.last.amount # short cut
      @results = []
      @total = 0
      try_bundles(some_bundles, flower_count, flower_count)
      if @total != flower_count and some_bundles.size > 1
        choose_bundles(flower_count, some_bundles.dup.drop(1))
      end
      raise ArgumentError, "Could not divide #{flower_count} flowers into bundles" if @results.empty? or @total != flower_count
      @results
    end

    def try_bundles(bundles_to_try, remaining_flowers, flower_count)
      return if remaining_flowers == 0 or @total >= flower_count
      bundles_to_try.each do |bundle|
        next if remaining_flowers < bundle.amount
        if bundle.amount == remaining_flowers
          add_to_results(bundle)
        else
          try_bundles(bundles_to_try, remaining_flowers - 1, flower_count)
        end
      end
    end

    private

    def add_to_results(bundle)
      existing = @results.find_index {|item| item[:size] == bundle.amount }
      if existing.nil?
        @results << {count: 1, size: bundle.amount, price: bundle.price}
      else
        @results[existing][:count] += 1
      end
      @total += bundle.amount
    end
  end
end
