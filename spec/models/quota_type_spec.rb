require 'rails_helper'

RSpec.describe QuotaType, type: :model do
  let(:quota_type) { create(:quota_type) }

  describe 'associations' do
    describe 'should has one quota type specification' do
      let!(:quota_type_specification) { create(:quota_type_specification, quota_type: quota_type) }
     
      it { expect(quota_type.quota_type_specification).to  be_instance_of(QuotaTypeSpecification) }
    end

    describe 'should has many expenses' do
      # pending
    end
  end
end
