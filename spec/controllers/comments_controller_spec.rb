require 'rails_helper'

RSpec.describe CommentsController do
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  let(:book) { FactoryGirl.create(:book) }
  describe 'POST create' do
    let(:comment_params) do
      {
        book: book,
        description: 'Descripcion de prueba'
      }
    end
    it 'populates an array of comments' do
      expect {
        post :create, params: { 
                                comment: comment_params,
                                book_id: book 
                              },
          format: 'js'
      }.to change(book.comments, :count).by(1)
    end
  end

end
