module FlowerBundler

  # A Flower represents the item actually being ordered.
  # Flowers are sold in bundles.
  class Flower
    attr_accessor :name, :code, :bundles

    def initialize(name:, code:, bundles:)
      @name = name
      @code = code
      @bundles = bundles.sort_by { |bundle| -bundle.amount }
    end

    def choose_bundles(flower_count, some_bundles = @bundles)
      fail ArgumentError, 'Not enough flowers' if flower_count < some_bundles.last.amount
      @results = []
      @total = 0
      try_bundles(some_bundles, flower_count, flower_count)
      if @total != flower_count && some_bundles.size > 1
        choose_bundles(flower_count, some_bundles.dup.drop(1))
      end
      fail ArgumentError, "Could not divide #{flower_count} flowers into bundles" if @results.empty? || @total != flower_count
      @results
    end

    private

    def try_bundles(bundles_to_try, remaining_flowers, flower_count)
      return if remaining_flowers == 0 || @total >= flower_count
      bundles_to_try.each do |bundle|
        next if remaining_flowers < bundle.amount
        if bundle.amount == remaining_flowers
          add_to_results(bundle)
        else
          try_bundles(bundles_to_try, remaining_flowers - 1, flower_count)
        end
      end
    end

    def add_to_results(bundle)
      existing = @results.find_index { |item| item[:size] == bundle.amount }
      if existing.nil?
        @results << { count: 1, size: bundle.amount, price: bundle.price }
      else
        @results[existing][:count] += 1
      end
      @total += bundle.amount
    end
  end
end
