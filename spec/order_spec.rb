require 'spec_helper'

describe FlowerBundler::Order do
  let(:count) { 10 }
  let(:code)  { 'R12'}
  subject { FlowerBundler::Order.parse "#{count} #{code}" }

  it 'has the right fields' do
    expect(subject.count).to eq count
    expect(subject.code).to eq code
  end
end
