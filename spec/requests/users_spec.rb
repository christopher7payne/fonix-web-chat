require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }

  describe 'GET user login path' do
    it 'returns http ok' do
      get new_user_session_path
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'DELETE user path' do
    it 'signs out user, returns to sign in page' do
      sign_in(user)
      delete destroy_user_session_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
