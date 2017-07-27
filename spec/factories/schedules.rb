FactoryGirl.define do
  factory :schedule do
    activity
    place
    sequence(:start_date) {|n| n.days.from_now }
    sequence(:end_date) {|n| 3.days.since n.days.from_now }
    sequence(:description) {|n| 'schedule_description_%d' % n }

    factory :invalid_schedule do
      activity nil
      place nil
      start_date nil
      end_date nil
      description nil
    end

    factory :bare_schedule do
      activity nil
      place nil
      start_date nil
      end_date nil
      description nil
    end

  end
end
