##
# Model pour les items
class Item < ActiveRecord::Base
  # ajout de la gem friendlyId pour generer les liens permanents
  extend FriendlyId
  friendly_id :titre, use: [:slugged, :finders] # finders: pour la methode find dans le controller en fonction de id de objet

  # validates :titre, presence: true, length: { maximum: 25, message: "titre trop long"}
  # validates :titre, :presence => true, :length => { :maximum => 25, :message => "titre trop long"}
  validates :titre, presence: { message: 'titre obligatoire' }, length: { maximum: 25, message: 'titre trop long' }
  validates :contenu, presence: true
  validates :image, presence: true
end
