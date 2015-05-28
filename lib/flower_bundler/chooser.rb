module FlowerBundler

  # does the actual flower bundle choosing
  class Chooser
    def initialize(flower:, flower_count:)
      @flower = flower
      @flower_count = flower_count
    end

    def choose(bundles_to_try = @flower.bundles.dup)
      @stash = []
      gather_bundles(@flower_count, bundles_to_try)
      @stash
    rescue BundleError
      bundles_to_try.shift
      retry unless bundles_to_try.empty?
      raise BundleError, "Can't make bundles from #{@flower_count} #{@flower.name}"
    end

    private

    def gather_bundles(flower_count, bundles_to_try)
      trim_bundles!(flower_count, bundles_to_try)
      @bundle = @allowed_bundles.first
      @count = flower_count / @bundle.size
      @stash << OrderResult.new(count: @count, bundle: @bundle)
      return if flower_count % @bundle.size == 0
      gather_bundles(recount(flower_count), @allowed_bundles)
    end

    def trim_bundles!(flower_count, bundles_to_try)
      @allowed_bundles = bundles_to_try.reject { |b| b.size > flower_count }
      fail BundleError if @allowed_bundles.empty?
    end

    def recount(flower_count)
      new_flower_count = flower_count - @count * @bundle.size
      if new_flower_count < @allowed_bundles.last.size
        adjusted_count(flower_count)
      else
        new_flower_count
      end
    end

    def adjusted_count(flower_count)
      check_remainders!
      @stash.last.decrement_count
      @allowed_bundles.shift
      flower_count - @stash.last.count * @bundle.size
    end

    def check_remainders!
      fail BundleError if @count == 1 || @allowed_bundles.size == 1
    end

  end
end
