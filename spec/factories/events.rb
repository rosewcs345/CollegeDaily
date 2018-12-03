FactoryBot.define do
  factory :event do
    title { "MyString" }
    category { "MyString" }
    host { "MyString" }
    location { "MyString" }
    description { "MyText" }
    date { "2018-12-03" }
    start_time { "2018-12-03 02:57:30" }
    end_time { "2018-12-03 02:57:30" }
    traits { "MyText" }
    user_id { 1 }
  end
end
