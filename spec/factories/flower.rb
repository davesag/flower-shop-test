FactoryGirl.define do
  factory :rose, class: FlowerBundler::Flower do
    skip_create
    name 'Roses'
    code 'R12'
    bundles { [
      create(:roses, :small),
      create(:roses, :large)
    ]}
    initialize_with { new(attributes) }
  end

  factory :lily, class: FlowerBundler::Flower do
    skip_create
    name 'Lilies'
    code 'L09'
    bundles { [
      create(:lilies, :small),
      create(:lilies, :medium),
      create(:lilies, :large)
    ]}
    initialize_with { new(attributes) }
  end

  factory :tulip, class: FlowerBundler::Flower do
    skip_create
    name 'Tulips'
    code 'T58'
    bundles { [
      create(:tulips, :small),
      create(:tulips, :medium),
      create(:tulips, :large)
    ]}
    initialize_with { new(attributes) }
  end
end
