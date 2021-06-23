require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:expense) { create(:expense) }
  let!(:parliamentarian) { create(:parliamentarian) }

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

  describe 'scopes' do
    describe 'should return sum total of the parliamentarian expenses' do
      let!(:sum_total1) { create(:expense, net_value: 10, parliamentarian: parliamentarian) }
      let!(:sum_total2) { create(:expense, net_value: 15, parliamentarian: parliamentarian) }
      it { expect(parliamentarian.expenses.sum_total_net_value).to eq(10 + 15) }
    end

    describe 'should return biggest value of the parliamentarian expenses' do
      let!(:expense1) { create(:expense, net_value: 10, parliamentarian: parliamentarian) }
      let!(:expense2) { create(:expense, net_value: 55, parliamentarian: parliamentarian) }
      it { expect(parliamentarian.expenses.biggest_value.net_value).to eq(expense2.net_value) }
    end
  end
end
