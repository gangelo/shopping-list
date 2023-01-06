# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Presenter do
  subject(:presenter) { described_class.new view_context }

  include_context 'with view_context'

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
      it 'responds_to? :controller' do
        expect(presenter).to respond_to :controller
      end
    end

    describe '#current_user' do
      it 'responds_to? :current_user' do
        expect(presenter).to respond_to :current_user
      end
    end

    describe '#user_signed_in?' do
      it 'responds_to? :user_signed_in?' do
        expect(presenter).to respond_to :user_signed_in?
      end
    end

    describe '#admin' do
      it 'responds_to? :admin' do
        expect(presenter).to respond_to :admin
      end
    end

    describe '#admin?' do
      it 'responds_to? :admin?' do
        expect(presenter).to respond_to :admin?
      end
    end
  end
end
