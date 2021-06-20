FactoryBot.define do
  factory :parliamentarian do
    name { 'parliamentarian' }
    number_person_id { '66519942049' }
    federation_unity { 'PR' }
    political_party { 'NS' }
    card_parliamentary { '123456' }
    register_id { 1 }
    legislature { build(:legislature) }
  end
end
