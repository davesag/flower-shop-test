require 'singleton'

module FlowerBundler

  # A simple singleton registry that hold the flowers that are for sale
  # and provides a simple mechanism for looking them up by their code
  class Catalogue
    include Singleton

    def initialize
      reset
    end

    def add(flower)
      fail ArgumentError, 'Expected a flower' if flower.nil? || !flower.is_a?(Flower)
      @flowers_by_code[flower.code.to_sym] = flower
    end

    def find(code)
      fail ArgumentError, 'Expected a code' if code.nil? || code.empty?
      @flowers_by_code[code.to_sym]
    end

    def reset
      @flowers_by_code = {}
    end

    def self.find(code)
      Catalogue.instance.find(code)
    end

    alias_method :'<<', :add
  end
end
