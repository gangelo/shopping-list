# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MenuAuthenticatedPresenter do
  include_context 'mock_view_context'

  subject(:menu_authenticated_presenter) { described_class.new view_context }

  # describe '#shopping_lists_css_class' do
  #   context 'when the user is on shopping_lists_path' do
  #     expect(menu_authenticated_presenter.shopping_lists_css_class).to eq 'text-white'
  #   end
  # end

  # describe '#name' do
  #   it 'returns the presenter name' do
  #     expect(menu_authenticated_presenter.name).to eq 'MenuAuthenticated'
  #   end
  # end

  describe '#to_partial_path' do
    it 'returns the partial path' do
      expect(menu_authenticated_presenter.to_partial_path).to eq 'menu_authenticated'
    end
  end
end
