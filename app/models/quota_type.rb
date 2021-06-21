class QuotaType < ApplicationRecord4
    has_one :quota_type_specification, dependent: :destroy
    has_many :expenses, dependent: :destroy
end
