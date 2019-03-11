# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET #index' do
    subject { get :index }
    context 'when not logged in' do
      it 'redirects to login url' do
        expect(subject).to redirect_to login_url
      end
    end
    context 'when logged in' do
      it 'displays all users' do
        allow(controller).to receive(:logged_in_user) { true }
        expect(subject).to render_template(:index)
      end
    end
  end
end
