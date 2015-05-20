FactoryGirl.define do
  factory :roses, class: FlowerBundler::FlowerBundle do
    skip_create
    trait :small do
      amount 5
      price 699
    end
    trait :large do
      amount 10
      price 1299
    end
    initialize_with { new(attributes) }
  end

  factory :lilies, class: FlowerBundler::FlowerBundle do
    skip_create
    trait :small do
      amount 3
      price 995
    end
    trait :medium do
      amount 6
      price 1699
    end
    trait :large do
      amount 9
      price 2499
    end
    initialize_with { new(attributes) }
  end

  factory :tulips, class: FlowerBundler::FlowerBundle do
    skip_create
    trait :small do
      amount 3
      price 599
    end
    trait :medium do
      amount 5
      price 995
    end
    trait :large do
      amount 9
      price 1699
    end
    initialize_with { new(attributes) }
  end

end
