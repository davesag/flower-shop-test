FactoryGirl.define do
  factory :receipt, class: FlowerBundler::Receipt do
    skip_create
    trait :ten_roses do
      request '10 R12'
      results { [build(:order_result, :ten_roses)] }
    end
    trait :fifteen_lilies do
      request '15 L09'
      results { [build(:order_result, :nine_lilies),
                 build(:order_result, :six_lilies )] }
    end
    trait :thirteen_tulips do
      request '13 T58'
      results { [build(:order_result, :five_tulips_times_two),
                 build(:order_result, :three_tulips )] }
    end
    initialize_with { new(attributes) }
  end
end
