#rails generate task item retro_frienlyid
namespace :item do
  desc "Generation retroactive des liens permanents" # permet de mettre à jour la BDD avec slug mis à jour suite à l'installation de la gem friendly_id
  task retro_frienlyid: :environment do
    Item.find_each(&:save)
  end

end
