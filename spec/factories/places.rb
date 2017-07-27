FactoryGirl.define do
  factory :place do
    user
    sequence(:name) {|n| 'place_name_%d' % n }
    sequence(:description) {|n| 'place_description_%d' % n }
    factory :invalid_place do
      user nil
      name nil
    end
    factory :bare_place do
      user nil
      name nil
      description nil
    end
  end
end
