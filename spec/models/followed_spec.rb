require 'rails_helper'

RSpec.describe Followed, type: :model do  
  it 'Valid with required attributes' do
    followed = build(:followed)  
    expect(followed).to be_valid 
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:external_url) }
    it { is_expected.to validate_presence_of(:genres) }
  end 
  
end
