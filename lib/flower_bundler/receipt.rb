module FlowerBundler

  # When a customer order has been processed the system must emit
  # a receipt that sumarises the order.
  class Receipt
    attr_reader :request, :results, :total

    def initialize(request:, results:)
      @request = request
      @results = results
      @total = compute_total
    end

    def ==(other)
      # a request will always construct the same results and total
      @request == other.request
    end

    def to_formatted
      output = "#{@request} #{to_dollars(@total)}"
      @results.each do |result|
        output.concat "\n     #{result.count} x #{result.size} #{to_dollars(result.price)}"
      end
      output
    end

    private

    def compute_total
      @results.inject(0) { |a, e| e.count * e.price + a }
    end

    def to_dollars(cents)
      "$#{format('%.2f', cents / 100.0)}"
    end
  end
end
