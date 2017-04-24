require 'rails_helper'

RSpec.describe RequestsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  let(:request) { FactoryGirl.create(:request, user: @user) }
  describe 'GET index' do
    it 'populates an array with requests' do
      request
      get :index
      expect(assigns(:requests)).to eq([request])
    end
  end

  describe 'POST create' do
    it 'creates a new request' do
      expect {
        post :create, params: { book_id: FactoryGirl.create(:book) },
          format: 'js'
      }.to change(@user.requests, :count).by(1)
    end
  end
end
