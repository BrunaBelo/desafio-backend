require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:expense) { create(:expense) }

  describe 'associations' do
    describe 'should belongs to parliamentarian' do
      it { expect(expense.parliamentarian).to be_instance_of(Parliamentarian) }
    end

    describe 'should belongs to provider' do
      it { expect(expense.provider).to be_instance_of(Provider) }
    end

    describe 'should belongs to quota_type' do
      it { expect(expense.quota_type).to be_instance_of(QuotaType) }
    end

    describe 'should belongs to expense_type' do
      it { expect(expense.expense_type).to be_instance_of(ExpenseType) }
    end
  end
end
