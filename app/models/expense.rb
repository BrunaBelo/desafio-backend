class Expense < ApplicationRecord
    belongs_to :parliamentarian
    belongs_to :provider
    belongs_to :quota_type
    belongs_to :expense_type

    # scopes
    scope :sum_total_net_value, -> { sum(:net_value) }
    scope :biggest_value, -> { max_by(&:net_value) }
end
