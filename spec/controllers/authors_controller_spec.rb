require 'rails_helper'

RSpec.describe AuthorsController do
  describe 'POST create' do
    let(:author_params) do { name: 'Gabriel Garcia Marquez' }
    end
    it 'creates a new author' do
      expect {
        post :create, params: { author: author_params }
      }.to change(Author, :count).by(1)
    end
  end
end
