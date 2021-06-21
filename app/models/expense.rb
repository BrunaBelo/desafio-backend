class Expense < ApplicationRecord
    belongs_to :parliamentarian
    belongs_to :provider
    belongs_to :quota_type
    belongs_to :expense_type
end
