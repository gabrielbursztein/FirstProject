require 'rails_helper'

RSpec.describe BooksController do
  before(:each) do 
    user = FactoryGirl.create(:user)
    sign_in user
  end

  let(:book) { FactoryGirl.create(:book) }
  let(:author) { FactoryGirl.create(:author) }
  describe 'GET index' do
    context 'there are books' do
      it 'populates an array of books' do
        book
        get :index
        expect(assigns(:books)).to eq([book])
      end

      it 'renders the :index view' do
        get :index
        expect(response).to render_template('index')
      end
    end

    context 'there are no books' do 
      it 'populates an array of books' do
        get :index
        expect(assigns(:books)).to eq([])
      end
    end     
  end

  describe 'GET new' do
    it 'populates an array of authors' do
      author
      get :new
      expect(assigns(:authors)).to eq([author])
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      let(:book_params) do
        {
          title: 'Prueba',
          description: 'Descripcion',
          author_id: author.id,
          year: 2000,
          image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'oneHundred.jpg'))
        }
      end

      it 'creates a new book' do
        expect {
          post :create, params: { book: book_params}
        }.to change(Book, :count).by(1)
      end

      it 'redirects to the show page' do
        post :create, params: { book: book_params }
        expect(response).to redirect_to Book.last
      end
    end

    context 'with invalid attributes' do
      let(:book_params) do
        {
          title: 'Prueba',
          description: 'Descripcion',
          author_id: author.id,
          year: 2000,
          image: nil
        }
      end
       it 'does not create a new book' do
        expect {
          post :create, params: { book: book_params}
        }.to_not change(Book, :count)
      end

      it 're-renders the new method' do
        post :create, params: { book: book_params }
        expect(response).to redirect_to new_book_path
      end
    end
  end

end
