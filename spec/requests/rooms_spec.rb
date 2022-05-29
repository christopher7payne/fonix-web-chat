require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  let!(:user) { create(:user) }

  describe 'GET room path' do
    it 'non logged in user returns http 302' do
      get all_rooms_path
      expect(response).to have_http_status(302)
    end

    it 'logged in user returns http ok' do
      sign_in(user)
      get all_rooms_path
      expect(response).to have_http_status(:ok)
    end
  end
end
