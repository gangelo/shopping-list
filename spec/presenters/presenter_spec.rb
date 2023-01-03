# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Presenter do
  subject(:presenter) { described_class.new view_context }

  include_context 'mock_view_context'

  describe '.new' do
    it 'instantiates a Presenter object' do
      expect { presenter }.not_to raise_error
    end
  end

  describe '#view_context' do
    it 'returns the view context object' do
      expect(presenter.view_context).to eq view_context
    end
  end

  describe '#current_user?' do
    context 'when current_user is present' do
      it 'returns true' do
        expect(presenter.current_user?).to be true
      end
    end

    context 'when current_user is not present' do
      let(:user) { nil }

      it 'returns false' do
        expect(presenter.current_user?).to be false
      end
    end
  end

  describe 'delegation' do
    describe '#controller' do
      it 'returns the controller object' do
        expect(presenter.controller).not_to be_nil
        expect(presenter.controller.controller_name).to eq 'controller_name'
        expect(presenter.controller.action_name).to eq 'action_name'
      end
    end

    describe '#current_user' do
      it 'returns the current user object' do
        expect(presenter.current_user).not_to be_nil
        expect(presenter.current_user).to eq user
      end
    end

    describe '#user_signed_in?' do
      let(:user_signed_in) { true }

      it 'returns the user signed in status' do
        expect(presenter.user_signed_in?).to eq user_signed_in
      end
    end
  end
end
