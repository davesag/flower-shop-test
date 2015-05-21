require 'spec_helper'

describe FlowerBundler::OrderResult do
  let(:receipt) { build :receipt, :thirteen_tulips }
  subject       { receipt }
  it { is_expected.not_to be_nil }
  its('results.size') { is_expected.to eq 2 }
  its(:request)       { is_expected.to eq '13 T58' }
  its(:total)         { is_expected.to eq 2585 }

  context 'produces tidy output' do
    let(:tidy_output) do
%q(13 T58 $25.85
     2 x 5 $9.95
     1 x 3 $5.95)
    end
    subject { receipt.to_formatted }
    it {is_expected.to eq tidy_output }
  end
end
