# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController do
  describe 'GET #index' do
    context 'when the user is not signed in' do
      it 'redirects' do
        get :index
        expect(response).to have_http_status(:found)
      end
    end

    context 'when the user is signed in' do
      before do
        sign_in_user
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
