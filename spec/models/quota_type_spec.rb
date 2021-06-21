require 'rails_helper'

RSpec.describe QuotaType, type: :model do
  let(:quota_type) { create(:quota_type) }

  describe 'associations' do
    describe 'should has one quota type specification' do
      let!(:quota_type_specification) { create(:quota_type_specification, quota_type: quota_type) }
     
      it { expect(quota_type.quota_type_specification).to  be_instance_of(QuotaTypeSpecification) }
    end

    describe 'should has many expenses' do
      let!(:expense1) { create(:expense, quota_type: quota_type) }
      let!(:expense2) { create(:expense, quota_type: quota_type) }

      it { expect(quota_type.expenses.count).to eq(2) }
      it { expect(quota_type.expenses).to include(expense1) }
      it { expect(quota_type.expenses).to include(expense2) }
    end
  end
end
