FactoryGirl.define do
  factory :activity do
    user
    sequence(:description) {|n| 'activity_description_%d' % n }
    factory :activity_with_schedules do
      transient do
        schedules_count 3
      end

      after(:create) do |activity, evaluator|
        create_list(:schedule, evaluator.schedules_count, activity: activity)
      end
    end
    factory :invalid_activity do
      user nil
      description nil
    end
    factory :bare_activity do
      user nil
      description nil
    end
  end
end
