FactoryBot.define do
  factory :profile do
    nick_name { "Name" }
    full_name { "Full" }
    age { 1 }
    user { create(:user) }
    author { false }
  end
end
