# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'the user is at the root path' do
  it 'renders the root path view' do
    expect(page).to have_current_path root_path
  end
end

RSpec.describe 'Menu' do
  let(:user) { create(:user) }

  context 'when the user is signed in' do
    before do
      sign_in user
      visit root_path
    end

    it_behaves_like 'the user is at the root path'

    it 'displays the authenticated user menu' do
      expect(page).to have_link 'Shopping lists'
      expect(page).to have_link 'Items'
      expect(page).to have_link 'Stores'
      expect(page).to have_link 'Dashboard'
      expect(page).to have_field placeholder: 'Search...'
      expect(page).to have_button 'Log out'
    end
  end

  context 'when the user is not signed in' do
    before do
      visit root_path
    end

    it_behaves_like 'the user is at the root path'

    it 'displays the unauthenticated user menu' do
      expect(page).to have_link 'FAQs'
      expect(page).to have_link 'About'
      expect(page).to have_link 'Login'
      expect(page).to have_link 'Sign-up'
    end
  end
end
