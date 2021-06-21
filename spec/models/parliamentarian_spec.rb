require 'rails_helper'

RSpec.describe Parliamentarian, type: :model do
  let(:parliamentarian) { create(:parliamentarian) }

  describe 'associations' do
    describe 'should belongs_to legislature' do      
      it { expect(parliamentarian.legislature).to be_instance_of(Legislature) }
    end

    describe 'should has many expenses' do
      let!(:expense1) { create(:expense, parliamentarian: parliamentarian) }
      let!(:expense2) { create(:expense, parliamentarian: parliamentarian) }

      it { expect(parliamentarian.expenses.count).to eq(2) }
      it { expect(parliamentarian.expenses).to include(expense1) }
      it { expect(parliamentarian.expenses).to include(expense2) }
    end
  end
end
