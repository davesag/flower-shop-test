module FlowerBundler
  class Catalogue
    include Singleton

    def initialize
      reset
    end

    def add(flower)
      raise ArgumentError, 'Expected a flower' if flower.nil? or !flower.is_a? Flower
      @flowers_by_code[flower.code] = flower
    end

    def find(code)
      raise ArgumentError, 'Expected a code' if code.nil? or code.empty?
      @flowers_by_code[code]
    end

    def reset
      @flowers_by_code = {}
    end

    alias_method :'<<', :add
  end
end
