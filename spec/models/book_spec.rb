require 'rails_helper'

RSpec.describe Book do
  let(:book) { FactoryGirl.build(:book) }
  it 'is valid with valid attributes' do
    expect(book).to be_valid
  end

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:year) }
  it { should validate_numericality_of(:year) }
  it { should have_many(:comments) }
  it { should have_many(:requests) }
end
