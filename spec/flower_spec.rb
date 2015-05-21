require 'spec_helper'

describe FlowerBundler::Flower do
  let(:rose)  { build :rose }
  let(:lily)  { build :lily }
  let(:tulip) { build :tulip }

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
      expect(subject.size).to eq 1
      expect(subject.first.count).to  eq 1
      expect(subject.first.size ).to  eq 10
      expect(subject.first.price).to  eq 1299
    end
  end

  context 'given a request for 15 lilies' do
    let(:count) { 15 }
    subject     { lily.choose_bundles count }

    it 'returns a bundle of 9 lilies and a bundle of 6 lilies' do
      expect(subject.size).to eq 2
      expect(subject.first.count).to  eq 1
      expect(subject.first.size ).to  eq 9
      expect(subject.first.price).to  eq 2495
      expect(subject.last.count ).to  eq 1
      expect(subject.last.size  ).to  eq 6
      expect(subject.last.price ).to  eq 1695
    end
  end

  context 'given a request for 13 tulips' do
    let(:count) { 13 }
    subject     { tulip.choose_bundles count }

    it 'returns 2 bundles of 5 tulips and a bundle of 3 tulips' do
      expect(subject.size).to eq 2
      expect(subject.first.count).to  eq 2
      expect(subject.first.size ).to  eq 5
      expect(subject.first.price).to  eq 995
      expect(subject.last.count ).to  eq 1
      expect(subject.last.size  ).to  eq 3
      expect(subject.last.price ).to  eq 595
    end
  end

end
