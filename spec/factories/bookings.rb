FactoryBot.define do
  factory :booking do
    event { nil }
    user { nil }
    vehicle { false }
    usable_seats { 1 }
  end
end
