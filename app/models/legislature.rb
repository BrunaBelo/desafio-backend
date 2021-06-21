class Legislature < ApplicationRecord
    has_many :parliamentarians, dependent: :destroy
end
