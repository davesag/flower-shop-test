FactoryGirl.define do
  factory :order_result, class: FlowerBundler::OrderResult do
    skip_create
    count 1
    trait :ten_roses do
      transient { bundle { build :roses, :large } }
    end
    trait :nine_lilies do
      transient { bundle { build :lilies, :large } }
    end
    trait :six_lilies do
      transient { bundle { build :lilies, :medium } }
    end
    trait :five_tulips_times_two do
      transient { bundle { build :tulips, :medium } }
      count 2
    end
    trait :three_tulips do
      transient { bundle { build :tulips, :small } }
    end

    initialize_with { new(bundle) }
  end
end
