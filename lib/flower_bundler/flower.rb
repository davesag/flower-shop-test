module FlowerBundler

  class BundleError < ArgumentError; end

  # A Flower represents the item actually being ordered.
  # Flowers are sold in bundles.
  class Flower
    attr_accessor :name, :code, :bundles

    def initialize(name:, code:, bundles:)
      @name = name
      @code = code
      @bundles = bundles.sort_by { |bundle| -bundle.amount }
    end

    def choose_bundles(flower_count, bundles_to_try = @bundles.dup)
      @stash = []
      gather_bundles(flower_count, bundles_to_try)
      @stash
    rescue BundleError
      bundles_to_try.shift
      retry unless bundles_to_try.empty?
      raise BundleError, "Can't make bundles from #{flower_count} #{@name}"
    end

    private

    def gather_bundles(flower_count, bundles_to_try)
      allowed_bundles = trim_bundles(flower_count, bundles_to_try)
      bundle = allowed_bundles.first
      count = flower_count / bundle.amount
      @stash << OrderResult.new(count: count, bundle: bundle)
      return if flower_count % bundle.amount == 0
      gather_bundles(flower_count - count * bundle.amount, allowed_bundles)
    end

    def trim_bundles(flower_count, bundles_to_try)
      allowed_bundles = bundles_to_try.reject { |b| b.amount > flower_count }
      fail BundleError if allowed_bundles.empty?
      allowed_bundles
    end

  end
end
