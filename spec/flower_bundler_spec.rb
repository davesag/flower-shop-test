require 'spec_helper'

describe FlowerBundler do
  let(:catalogue) { FlowerBundler::Catalogue.instance }
  let(:rose)      { build :rose  }
  let(:lily)      { build :lily  }
  let(:tulip)     { build :tulip }
  let(:order)     { (expected.map { |receipt| receipt.request }).join("\n") }

  let(:expected) do
    [
      build(:receipt, :ten_roses),
      build(:receipt, :fifteen_lilies),
      build(:receipt, :thirteen_tulips)
    ]
  end

  before do
    catalogue << rose
    catalogue << lily
    catalogue << tulip
  end

  after { catalogue.reset }

  it 'returns the correct output' do
    expect(FlowerBundler.process_order(order)).to eq expected
  end

end
