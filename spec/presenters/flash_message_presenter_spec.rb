# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlashMessagePresenter do
  let(:message) { 'message' }
  let(:type) { :notice }

  describe 'constants' do
    describe '::TYPES' do
      it 'returns the types of messages' do
        expect(described_class::TYPES).to match_array %i[alert notice]
      end
    end

    describe '::TYPE_CSS_CLASSES' do
      it 'returns the css classes for the message types' do
        expect(described_class::TYPE_CSS_CLASSES).to include(
          alert: 'alert-danger',
          notice: 'alert-success',
        )
      end
    end
  end

  describe '#css_class' do
    context 'when type :alert' do
      it 'returns the css class' do
        expect(described_class.new('message', type: :alert).css_class).to eq described_class::TYPE_CSS_CLASSES[:alert]
      end
    end

    context 'when type :notice' do
      it 'returns the css class' do
        expect(described_class.new('message', type: :notice).css_class).to eq described_class::TYPE_CSS_CLASSES[:notice]
      end
    end
  end

  describe '.collection' do
    subject(:flash_message_presenter) do
      described_class.collection message, type: type
    end

    context 'with a single message' do
      context 'with type :notice' do
        it 'returns the message prefixed with a notice exclaimation blurb' do
          expect(flash_message_presenter[0].message).to match /.+ #{message}\z/
        end
      end

      context 'with other than type :notice' do
        let(:type) { :alert }

        it 'returns the message' do
          expect(flash_message_presenter[0].message).to match /\A#{message}\z/
        end
      end
    end

    context 'with a collection of messages' do
      let(:message) { %w[message1 message2 message3] }

      it 'returns a collection of FlashMessagePresenter objects' do
        expect(flash_message_presenter).to all(be_a(described_class))
      end
    end
  end
end
