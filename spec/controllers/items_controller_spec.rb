require 'rails_helper'

describe ItemsController, :type => :controller do
  context "check pages" do
    describe "GET #index" do # vérifie si la page items#index existe
      it "return http status code 200" do
        get :index
        expect(response).to have_http_status(200)
      end
    end
    
    describe "GET #new" do # vérifie si la page items#new existe
      it "return http status code 200" do
        get :new
        expect(response).to have_http_status(200)
      end
    end
    
    describe "GET #show:id" do # vérifie si la page items#show:id existe
      it "return http status code 200" do
        @item = Item.create!(titre: 'test titre', contenu: 'test contenu')
        get :show, id: @item.id
        #get :show, :id => @item # BON FORMAT
        expect(response).to have_http_status(200)
      end
    end
    
    describe "GET #edit" do # vérifie si la page items#edit:id existe
      it "return http status code 200" do
        @item = Item.create!(titre: 'test titre', contenu: 'test contenu')
        get :edit, id: @item.id
        expect(response).to have_http_status(200)
      end
    end
  end
  
  describe 'DELETE destroy' do
    before :each do
      @attr = { 
        :titre => "Exemple titre", 
        :contenu => "Exemple de contenu"
      }
      @item = Item.create!(@attr) # création d'un objet Item
    end
    
    it "deletes the item" do
      #expect{
      #  delete :destroy, id: @item.id      
      #}.to change(Item, :count).by(-1)
      #delete :destroy, id: @item.id
      #expect(response).to change(Item, :count).by(-1)
      expect{delete :destroy, id: @item.id}.to change(Item, :count).by(-1)
    end
      
    it "redirects to items#index" do
      delete :destroy, id: @item.id
      #response.should redirect_to contacts_url
      expect(response).to redirect_to(root_path)
    end
  end
end
