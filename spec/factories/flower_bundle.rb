FactoryGirl.define do
  factory :roses, class: FlowerBundler::FlowerBundle do
    skip_create
    trait :small do
      size 5
      price 699
    end
    trait :large do
      size 10
      price 1299
    end
    initialize_with { new(attributes) }
  end

  factory :lilies, class: FlowerBundler::FlowerBundle do
    skip_create
    trait :small do
      size 3
      price 995
    end
    trait :medium do
      size 6
      price 1695
    end
    trait :large do
      size 9
      price 2495
    end
    initialize_with { new(attributes) }
  end

  factory :tulips, class: FlowerBundler::FlowerBundle do
    skip_create
    trait :small do
      size 3
      price 595
    end
    trait :medium do
      size 5
      price 995
    end
    trait :large do
      size 9
      price 1699
    end
    initialize_with { new(attributes) }
  end

end
