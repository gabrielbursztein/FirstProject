require 'rails_helper'

RSpec.describe Author do
  it 'is valid with valid attributes' do
    expect(FactoryGirl.create(:author)).to be_valid
  end
  it { should validate_presence_of(:name) }
end
