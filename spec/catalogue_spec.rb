require 'spec_helper'

describe FlowerBundler::Catalogue do
  let(:catalogue) { described_class.instance }
  let(:tulip)     { build :tulip }
  subject         { catalogue.find(tulip.code) }

  context 'when empty, the result of a find' do
    it { is_expected.to be_nil }
  end

  context 'adding a Tulip and finding it by its code' do

    before { catalogue <<  tulip }
    after  { catalogue.reset }

    its(:name) { is_expected.to eq 'Tulips' }
  end
end
