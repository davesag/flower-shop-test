module FlowerBundler

  # A Flower represents the item actually being ordered.
  # Flowers are sold in bundles.
  class Flower
    attr_reader :name, :code, :bundles

    def initialize(name:, code:, bundles:)
      @name = name.freeze
      @code = code.freeze
      @bundles = (bundles.sort_by { |bundle| -bundle.size }).freeze
    end

  end
end
