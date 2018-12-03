FactoryBot.define do
  factory :event do
    title { "MyString" }
    category { "MyString" }
    host { "MyString" }
    location { "MyString" }
    description { "MyText" }
    date { "2018-12-03" }
    start_time { "2018-12-03 16:57:43" }
    end_time { "2018-12-03 16:57:43" }
    traits { "MyText" }
    user_id { 1 }
  end
end
