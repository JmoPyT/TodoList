##
# Model pour les items
class Item < ActiveRecord::Base
  belongs_to :user

  # ajout de la gem friendlyId pour generer les liens permanents
  extend FriendlyId
  friendly_id :titre, use: [:slugged, :finders] # finders: pour la methode find dans le controller en fonction de id de objet

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100", crop: "200x200#" }, default_url: "/images/:style/missing.png"
  validates_attachment  :image, presence: { message: 'image obligatoire' }, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  # validates :titre, presence: true, length: { maximum: 25, message: "titre trop long"}
  # validates :titre, :presence => true, :length => { :maximum => 25, :message => "titre trop long"}
  validates :titre, presence: { message: 'titre obligatoire' }, length: { maximum: 25, message: 'titre trop long' }
  validates :contenu, presence: { message: 'contenu obligatoire' }
  # validates :image, presence: true
end
