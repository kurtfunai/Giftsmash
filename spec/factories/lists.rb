# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list do
    title "Birthday List"
    description "Its going to be a banging good time"
    event_date Time.now

    association :user
  end
end
