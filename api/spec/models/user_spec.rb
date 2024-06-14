require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#authenticate' do
    let(:user) { build(:user, password: 'password123') }

    context 'with correct password' do
      it 'returns the user' do
        expect(user.valid_password?('password123')).to be(true)
      end
    end

    context 'with correct password and email' do
      it 'return a valid user' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context 'with incorrect password' do
      it 'returns false' do
        expect(user.valid_password?('wrongpassword')).to be(false)
      end

      it 'with short password' do
        user = FactoryBot.build(:user, password: 'short', password_confirmation: 'short')
        expect(user).not_to be_valid
      end
    end

    context 'with incorrect email' do
      it 'with invalid email' do
        user = FactoryBot.build(:user, email: 'invalid_email')
        expect(user).not_to be_valid
      end
    end

    describe "when a user signs up" do
      before do
        ActionMailer::Base.deliveries.clear
      end

      let!(:user) { FactoryBot.create(:user) }

      it "with an email already existing" do
        current_user = described_class.first
        new_user = FactoryBot.build(:user, email: current_user.email)
        expect { new_user.save! }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Email has already been taken')
      end

      it "with valid data" do
        expect(user).to be_valid
      end

      it "sends an email when user is created" do
        expect(Devise.mailer.deliveries.count).to eq 1
      end
    end
  end
end
