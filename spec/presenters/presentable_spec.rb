# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Presentable do
  subject(:presentable) do
    Class.new do
      include Presentable
      def self.name
        'PresenterKlass'
      end
    end
  end

  describe '#name' do
    context 'when the class name does not end with "[p|P]resenter"' do
      it 'returns class.name' do
        expect(presentable.new.name).to eq 'PresenterKlass'
      end
    end

    context 'when the class name ends with "Presenter"' do
      subject(:presentable) do
        Class.new do
          include Presentable
          def self.name
            'TestPresenter'
          end
        end
      end

      it 'returns class.name minus "Presenter"' do
        expect(presentable.new.name).to eq 'Test'
      end
    end

    context 'when the class name ends with "presenter"' do
      subject(:presentable) do
        Class.new do
          include Presentable
          def self.name
            'Testpresenter'
          end
        end
      end

      it 'returns class.name minus "presenter"' do
        expect(presentable.new.name).to eq 'Test'
      end
    end
  end

  describe '#to_partial_path' do
    context 'when the class name does not end with "[p|P]resenter"' do
      it 'returns class.name#underscore' do
        expect(presentable.new.to_partial_path).to eq 'presenter_klass'
      end
    end

    context 'when the class name ends with "Presenter"' do
      subject(:presentable) do
        Class.new do
          include Presentable
          def self.name
            'MyTestPresenter'
          end
        end
      end

      it 'returns the class.name#underscore (removes "Presenter")' do
        expect(presentable.new.to_partial_path).to eq 'my_test'
      end
    end

    context 'when the class name ends with "presenter"' do
      subject(:presentable) do
        Class.new do
          include Presentable
          def self.name
            'MyTestpresenter'
          end
        end
      end

      it 'returns the class.name#underscore (removes "presenter")' do
        expect(presentable.new.to_partial_path).to eq 'my_test'
      end
    end
  end
end
