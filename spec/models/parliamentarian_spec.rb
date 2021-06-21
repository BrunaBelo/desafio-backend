require 'rails_helper'

RSpec.describe Parliamentarian, type: :model do
  let(:parliamentarian) { create(:parliamentarian) }

  describe 'associations' do
    describe 'should belongs_to legislature' do
      let!(:legislature) { create(:legislature) }
      
      it { expect(parliamentarian.legislature).to be_instance_of(Legislature) }
    end
  end
end
