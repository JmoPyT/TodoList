require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do # verifie si la page user#new existe
    it 'return http status code 200' do
      get :new, locale: 'fr'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show:id' do # verifie si la page items#show:id existe
    it 'return http status code 200' do
      user = create(:user)
      get :show, id: user, locale: 'fr'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create a new user' do
        expect { post :create, user: attributes_for(:user), locale: 'fr' }.to change(User, :count).by(1)
      end
      it 'redirect to user page' do
        post :create, user: attributes_for(:user), locale: 'fr'
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid attributes' do
      it 'not create a new user' do
        expect { post :create, user: attributes_for(:user, email: 'test.email'), locale: 'fr' }.to_not change(User, :count)
      end
      it 're-render new' do
        post :create, user: attributes_for(:user, nom: nil), locale: 'fr'
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do # runs the block one time before each of your specs in the file
      @user = create(:user)
    end

    it 'delete the user' do
      expect { delete :destroy, id: @user, locale: 'fr' }.to change(User, :count).by(-1)
    end

    it 'redirect to root_path' do
      delete :destroy, id: @user, locale: 'fr'
      expect(response).to redirect_to(root_path)
    end
  end
end
