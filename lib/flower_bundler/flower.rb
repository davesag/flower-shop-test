module FlowerBundler
  class Flower
    attr_accessor :name, :code, :bundles

    def initialize(name:, code:, bundles:)
      @name = name
      @code = code
      @bundles = bundles
    end
  end
end