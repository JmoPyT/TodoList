class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "pas au bon format")
    end
  end
end

class User < ActiveRecord::Base
  # associations
  has_many :items, dependent: :destroy

  # ajout de la gem friendlyId pour generer les liens permanents
  extend FriendlyId
  friendly_id :nom, use: [:slugged, :finders] # finders: pour la methode find dans le controller en fonction de id de objet

  # validations
  validates :nom, presence: { message: 'nom obligatoire' }, length: { maximum: 20, message: 'nom trop long' }
  validates :email, presence: { message: 'email obligatoire' }, uniqueness: true, email: true
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
