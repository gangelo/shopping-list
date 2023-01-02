# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { create(:user) }

  describe 'validations' do
    it { should validate_length_of(:first_name).is_at_most(32).allow_blank }
    it { should validate_length_of(:last_name).is_at_most(32).allow_blank }
  end

  describe 'associations' do
    it 'has associations'
  end

  describe 'callbacks' do
    before do
      user.first_name.upcase
      user.last_name.upcase
      user.email.upcase
      user.save!
    end

    let(:user) { create(:user) }

    context '.before_save' do
      describe 'normalizes #first_name, #last_name and #email' do
        it 'converts #first_name to capitalize' do
          expect(user.first_name).to eq user.first_name.capitalize
        end

        it 'converts #last_name to capitalize' do
          expect(user.last_name).to eq user.last_name.capitalize
        end

        it 'converts #email to downcase' do
          expect(user.email).to eq user.email.downcase
        end
      end
    end
  end

  describe '#admin?' do
    it 'returns false' do
      expect(user.admin?).to eq false
    end
  end

  describe '#full_name?' do
    context 'when first_name and last_name are present?' do
      it 'returns true' do
        expect(user.full_name?).to eq true
      end
    end

    context 'when first_name and last_name are not present?' do
      subject(:user) { create(:user, first_name: nil, last_name: nil) }

      it 'returns true' do
        expect(user.full_name?).to eq false
      end
    end
  end

  describe '#full_name_or_email' do
    context 'when first_name and last_name are present?' do
      it "returns user's the full name" do
        expect(user.full_name_or_email).to eq "#{user.first_name} #{user.last_name}"
      end
    end

    context 'when first_name and last_name are not present?' do
      subject(:user) { create(:user, first_name: nil, last_name: nil) }

      it "returns the user's email" do
        expect(user.full_name_or_email).to eq user.email
      end
    end
  end
end
