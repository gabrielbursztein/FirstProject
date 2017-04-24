require 'rails_helper'

RSpec.describe User do
  it 'is valid with valid attributes' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  let(:book) { FactoryGirl.create(:book) }
  let(:user) { FactoryGirl.create(:user) }

  describe '#requested?' do
    it 'requested a book' do
      FactoryGirl.create(:request, book: book, user: user)
      expect(user.requested?(book)).to be true
    end

    it 'did not requested a book' do
      FactoryGirl.create(:request, book: book)
      expect(user.requested?(book)).to be false
    end
  end

  describe '#request_status' do
    it 'has a pending request' do
      FactoryGirl.create(:request, book: book, user: user, status: 0)
      expect(user.request_status(book)).to eq('Pending')
    end

    it 'has a deied request' do
      FactoryGirl.create(:request, book: book, user: user, status: 1)
      expect(user.request_status(book)).to eq('Denied')
    end

    it 'has a approved request' do
      FactoryGirl.create(:request, book: book, user: user, status: 2)
      expect(user.request_status(book)).to eq('Approved')
    end
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }
  it { should have_many(:requests) }
  it { should have_many(:books).through(:requests) }
end
