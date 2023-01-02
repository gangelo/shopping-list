# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MenuPresenter do
  include_context 'mock_view_context'

  subject(:menu_presenter) { described_class.new view_context }

  describe 'included modules' do
    it { include Presentable }
  end

  describe '#name' do
    it 'returns the presenter name' do
      expect(menu_presenter.name).to eq 'Menu'
    end
  end

  describe '#to_partial_path' do
    it 'returns the partial path' do
      expect(menu_presenter.to_partial_path).to eq 'menu'
    end
  end

  describe '#content' do
    context 'when the user is signed in' do
      let(:user_signed_in) { true }

      it 'returns a MenuAuthenticatedPresenter presenter object' do
        expect(menu_presenter.content).to be_a MenuAuthenticatedPresenter
      end
    end

    context 'when the user is signed in' do
      let(:user_signed_in) { false }

      it 'returns a MenuUnauthenticatedPresenter presenter object' do
        expect(menu_presenter.content).to be_a MenuUnauthenticatedPresenter
      end
    end
  end
end
