require 'spec_helper'

describe FlowerBundler::OrderResult do
  subject { build :order_result, :five_tulips_times_two }
  it { is_expected.not_to be_nil }
  its(:count)  { is_expected.to eq 2 }
  its(:size)   { is_expected.to eq 5 }
  its(:price)  { is_expected.to eq 995 }
end
