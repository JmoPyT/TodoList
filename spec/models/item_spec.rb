require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:each) do # exécuter avant chaque test = création d'une variable attr contenant les attributs titre et contenu
    @attr = { 
      :titre => "Exemple titre", 
      :contenu => "Exemple de contenu"
      }
  end
  
  it "create new instance" do # vérifie que l'objet Item est bien créé
    Item.create!(@attr)
  end
  
  describe "Attribute 'titre'" do
    it "must be present and not empty" do
      bad_item = Item.new(@attr.merge(:titre => "")) # création d'un objet Item avec un titre vide 
      expect(bad_item).not_to be_valid # vérification que l'objet n'est pas valide
    end
    
    it "has maximum length of 25 characters" do
      bad_item = Item.new(@attr.merge(:titre => "abcdefghijklmnopqrstuvwxyz0123456789")) # création d'un objet Item avec un titre très long
      expect(bad_item).not_to be_valid # vérification que l'objet n'est pas valide
    end
  end
  
  describe "Attribute 'contenu'" do
    it "must be present and not empty" do
      bad_item = Item.new(@attr.merge(:contenu => "")) # création d'un objet Item avec un contenu vide 
      expect(bad_item).not_to be_valid # vérification que l'objet n'est pas valide
    end
  end
end
