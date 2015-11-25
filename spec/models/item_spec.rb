require 'rails_helper'

RSpec.describe Item, type: :model do
  # before(:each) do # executer avant chaque test = creation variable attr contenant les attributs titre et contenu
    # @attr = {
    #  titre: 'Exemple titre',
    #  contenu: 'Exemple de contenu',
    #  image: 'image.jpg'
    # }
  #  @attr = attributes_for(:item)
  # end

  it 'has a valid factory' do # verifie objet Item est bien cree
    build(:item)
  end

  describe "Attribute 'titre'" do
    it 'is not valid if is empty' do
      bad_item = build(:item, titre: '') # creation objet Item avec un titre vide
      expect(bad_item).not_to be_valid # verification que objet pas valide
    end

    it 'is not valid if size > 25 characters' do
      bad_item = build(:item, titre: 'abcdefghijklmnopqrstuvwxyz0123456789') # creation un objet Item avec un titre tres long
      expect(bad_item).not_to be_valid # verification que objet pas valide
    end
  end

  describe "Attribute 'contenu'" do
    it 'is not valid if is empty' do
      bad_item = build(:item, contenu: nil) # creation objet Item avec un contenu vide
      expect(bad_item).not_to be_valid # verification que objet pas valide
    end
  end

  describe "Attribute 'image'" do
    it 'is not valid if is empty' do
      bad_item = build(:item, image: nil) # creation objet Item avec une image vide
      expect(bad_item).not_to be_valid # verification que objet pas valide
    end
  end
end
