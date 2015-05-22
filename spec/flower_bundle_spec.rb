require 'spec_helper'

describe FlowerBundler::FlowerBundle do
  subject { build :roses, :small }

  it { is_expected.not_to be_nil }
  its(:size) { is_expected.to eq 5 }
  its(:price)  { is_expected.to eq 699 }
end
