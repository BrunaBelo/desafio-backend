require 'rails_helper'

RSpec.describe QuotaTypeSpecification, type: :model do
  let(:quota_type_specification) { create(:quota_type_specification) }

  describe 'associations' do
    describe 'should belongs to quota_type' do
      it { expect(quota_type_specification.quota_type).to be_instance_of(QuotaType) }
    end
  end
end
