require 'spec_helper'

describe FlowerBundler::Flower do
  let(:rose) { build :rose }

  describe 'created rose' do
    subject { rose }

    it { is_expected.not_to be_nil }
    its(:name) { is_expected.to eq 'Roses'}
    its(:code) { is_expected.to eq 'R12'}
    its('bundles.size') { is_expected.to eq 2 }
  end

  context 'given a request for 10 roses' do
    let(:count) { 10 }
    subject     { rose.choose_bundles count }

    it 'returns a single bundle of 10 roses' do
      pending "not yet implemented"
      expect(subject[:count]).to  eq 1
      expect(subject[:size] ).to  eq 10
      expect(subject[:price]).to  eq 1299
    end
  end
end
