require 'rails_helper'

RSpec.describe Legislature, type: :model do
  let(:legislature) { create(:legislature) }

  describe 'associations' do
    describe 'should has many parliamentarians' do
      let!(:parliamentarian1) { create(:parliamentarian, legislature: legislature) }
      let!(:parliamentarian2) { create(:parliamentarian, legislature: legislature) }

      it { expect(legislature.parliamentarians.count).to eq(2) }
      it { expect(legislature.parliamentarians).to include(parliamentarian1) }
      it { expect(legislature.parliamentarians).to include(parliamentarian2) }
    end
  end
end
