# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'a successful request' do
  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end
end

RSpec.describe HomeController do
  describe 'GET #index' do
    before do
      get :index
    end

    context 'when the user is not signed in' do
      it_behaves_like 'a successful request'
    end

    context 'when the user is signed in' do
      before do
        sign_in_user
      end

      it_behaves_like 'a successful request'
    end
  end
end
