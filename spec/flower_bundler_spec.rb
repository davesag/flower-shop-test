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

  context "can't make bundles given a sensible flower code" do
    let(:order) { "99 #{rose.code}" }
    it 'fails with a BundleError' do
      expect{FlowerBundler.process_order(order)}.to raise_error FlowerBundler::BundleError
    end
  end

  context "can't make bundles given a rubbish flower code" do
    let(:order) { "99 luftbaloon" }
    it 'fails with an UnknownFlowerError' do
      expect{FlowerBundler.process_order(order)}.to raise_error FlowerBundler::UnknownFlowerError
    end
  end
end
