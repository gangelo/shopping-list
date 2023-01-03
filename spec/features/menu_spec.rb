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

    it 'displays the Shopping lists menu item' do
      expect(page).to have_link 'Shopping lists'
    end

    it 'displays the Items menu item' do
      expect(page).to have_link 'Items'
    end

    it 'displays the Stores menu item' do
      expect(page).to have_link 'Stores'
    end

    it 'displays the Dashboard menu item' do
      expect(page).to have_link 'Dashboard'
    end

    it 'displays the Search textbox' do
      expect(page).to have_field placeholder: 'Search...'
    end

    it 'displays the Log out button' do
      expect(page).to have_button 'Log out'
    end
  end

  context 'when the user is not signed in' do
    before do
      visit root_path
    end

    it_behaves_like 'the user is at the root path'

    it 'displays the FAQs menu item' do
      expect(page).to have_link 'FAQs'
    end

    it 'displays the About menu item' do
      expect(page).to have_link 'About'
    end

    it 'displays the Login menu item' do
      expect(page).to have_link 'Login'
    end

    it 'displays the Sign-up menu item' do
      expect(page).to have_link 'Sign-up'
    end
  end
end
