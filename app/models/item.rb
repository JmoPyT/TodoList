class Item < ActiveRecord::Base
  #validates :titre, presence: true, length: { maximum: 25, message: "titre trop long"}
  #validates :titre, :presence => true, :length => { :maximum => 25, :message => "titre trop long"}
  validates :titre, :presence => { :message => "titre obligatoire" }, :length => { :maximum => 25, :message => "titre trop long"}
  validates :contenu, presence: true
end
