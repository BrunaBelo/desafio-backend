FactoryBot.define do
  factory :quota_type_specification do
    description { 'description' }
    number { 1 }
    quota_type { build(:quota_type) }
  end
end
