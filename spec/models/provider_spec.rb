require 'rails_helper'

RSpec.describe Provider, type: :model do
  let(:provider) { create(:provider) }
  
  describe 'associations' do
    describe 'should has many expenses' do
      let!(:expense1) { create(:expense, provider: provider) }
      let!(:expense2) { create(:expense, provider: provider) }

      it { expect(provider.expenses.count).to eq(2) }
      it { expect(provider.expenses).to include(expense1) }
      it { expect(provider.expenses).to include(expense2) }
    end
  end
end
