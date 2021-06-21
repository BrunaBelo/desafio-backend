require 'rails_helper'

RSpec.describe ExpenseType, type: :model do
  let(:expense_type) { create(:expense_type) }

  describe 'associations' do
    describe 'should has many expenses' do
      let!(:expense1) { create(:expense, expense_type: expense_type) }
      let!(:expense2) { create(:expense, expense_type: expense_type) }

      it { expect(expense_type.expenses.count).to eq(2) }
      it { expect(expense_type.expenses).to include(expense1) }
      it { expect(expense_type.expenses).to include(expense2) }
    end
  end
end
