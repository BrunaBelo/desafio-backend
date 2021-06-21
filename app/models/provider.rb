class Provider < ApplicationRecord
    has_many :expenses, dependent: :destroy
end
