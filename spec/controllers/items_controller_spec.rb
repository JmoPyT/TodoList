require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #index' do
    it 'return http status code 200' do # verifie si la page items#index existe
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do # verifie si la page items#new existe
    it 'return http status code 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show:id' do # verifie si la page items#show:id existe
    it 'return http status code 200' do
      item = create(:item)
      get :show, id: item
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do # verifie si la page items#edit:id existe
    it 'return http status code 200' do
      item = create(:item)
      get :edit, id: item
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create a new item' do
        expect { post :create, item: attributes_for(:item) }.to change(Item, :count).by(1)
      end
      it 'redirect to root_path' do
        post :create, item: attributes_for(:item)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid attributes' do
      it 'not create a new item' do
        expect { post :create, item: attributes_for(:item, titre: nil) }.to_not change(Item, :count)
      end
      it 're-render new' do
        post :create, item: attributes_for(:item, contenu: nil)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do # runs the block one time before each of your specs in the file
      @item = create(:item_db)
    end

    it 'delete the item' do
      expect { delete :destroy, id: @item }.to change(Item, :count).by(-1)
    end

    it 'redirect to root_path' do
      delete :destroy, id: @item
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'PUT #update:id' do
    before :each do
      @item = create(:item, titre: 'titre maj', contenu: 'contenu maj')
    end

    context 'with valid attributes' do
      it 'redirect to root_path' do
        put :update, id: @item, item: attributes_for(:item)
        expect(response).to redirect_to(root_path)
      end
    end
    
    context 'with invalid attributes' do
      it 're-render edit' do
        put :update, id: @item, item: attributes_for(:item, titre: nil)
        expect(response).to render_template('edit')
      end
    end
  end
end
