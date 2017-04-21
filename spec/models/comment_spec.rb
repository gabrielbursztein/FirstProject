require 'rails_helper'

RSpec.describe Comment do
  it "is valid with valid attributes" do
    expect(FactoryGirl.create(:comment)).to be_valid
  end

  it { should validate_presence_of(:rate) }
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:rate) }
  it { should belong_to(:book) }
  it { should belong_to(:user) }
end
