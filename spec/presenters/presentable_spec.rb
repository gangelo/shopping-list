# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Presentable do
  subject(:presentable) do
    Class.new do
      include Presentable
    end.new
  end

  describe '#name' do
    context 'when not overridden' do
      it 'raises an error' do
        expect { presentable.name }.to raise_error NotImplementedError
      end
    end
  end

  describe '#to_partial_path' do
    context 'when not overridden' do
      it 'raises an error' do
        expect { presentable.to_partial_path }.to raise_error NotImplementedError
      end
    end
  end
end
