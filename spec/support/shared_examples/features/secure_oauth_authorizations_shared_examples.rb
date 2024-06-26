# frozen_string_literal: true

RSpec.shared_examples 'Secure OAuth Authorizations' do
  context 'when user is confirmed' do
    let(:user) { create(:user) }

    it 'asks the user to authorize the application' do
      expect(page).to have_text "#{application.name} is requesting access to your account on"
    end
  end

  context 'when user is unconfirmed' do
    let(:user) { create(:user, :unconfirmed) }

    it 'displays an error' do
      expect(page).to have_text I18n.t('doorkeeper.errors.messages.unconfirmed_email')
    end
  end
end
