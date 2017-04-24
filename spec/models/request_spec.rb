require 'rails_helper'

RSpec.describe Request do
  let(:request) { FactoryGirl.build(:request) }
  it 'is valid with valid attributes' do
    expect(request).to be_valid
  end
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:book) }
  it { should validate_presence_of(:status) }
end
