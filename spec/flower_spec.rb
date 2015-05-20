require 'spec_helper'

describe FlowerBundler::Flower do
  subject { build :rose }

  it { is_expected.not_to be_nil }
  its(:name) { is_expected.to eq 'Roses'}
  its(:code) { is_expected.to eq 'R12'}
  its('bundles.size') { is_expected.to eq 2 }
end
