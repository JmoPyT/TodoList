require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do # verifie que objet User est bien cree
    build(:user)
    create(:user_with_items)
  end

  describe "Attribute 'nom'" do
    it 'is not valid if is empty' do
      bad_user = build(:user, nom: nil) # creation objet User avec un nom vide
      expect(bad_user).not_to be_valid # verification que objet pas valide
    end

    it 'is not valid if size > 20 characters' do
      bad_user = build(:user, nom: 'abcdefghijklmnopqrstuvwxyz') # creation un objet User avec un nom tres long
      expect(bad_user).not_to be_valid # verification que objet pas valide
    end
  end

  describe "Attribute 'email'" do
    it 'is not valid if is empty' do
      bad_user = build(:user, email: nil) # creation objet User avec un email vide
      expect(bad_user).not_to be_valid # verification que objet pas valide
    end

    context 'wrong format' do
      it 'is not valid without domain' do
        bad_user = build(:user, email: 'test@email') # creation un objet User avec un email au mauvais format
        expect(bad_user).not_to be_valid # verification que objet pas valide
      end

      it 'is not valid without @' do
        bad_user = build(:user, email: 'test.email') # creation un objet User avec un email au mauvais format
        expect(bad_user).not_to be_valid # verification que objet pas valide
      end
    end
  end
end
