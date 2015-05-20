require 'spec_helper'

describe FlowerBundler do

  let(:order) { (expected.map { |result| result[:request] }).join("\n") }

  let(:expected) do
    [
      {
        request: '10 R12',
        total:   1299,
        bundles: [
          {
            count: 1,
            size:  10,
            price: 1299
          }
        ]
      },
      {
        request: '15 L09',
        total:   4190,
        bundles: [
          {
            count: 1,
            size:  9,
            price: 2495
          },
          {
            count: 1,
            size:  6,
            price: 1695
          }
        ]
      },
      {
        request: '13 T58',
        total:   2585,
        bundles: [
          {
            count: 2,
            size:  5,
            price: 995
          },
          {
            count: 1,
            size:  3,
            price: 595
          }
        ]
      }
    ]
  end

  it 'returns the correct output' do
    pending "Not yet implemented"
    expect(FlowerBundler.process_order(order)).to eq expected
  end

end
