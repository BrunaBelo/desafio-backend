class ExpenseType < ApplicationRecord
    has_many :expenses, dependent: :destroy
end
