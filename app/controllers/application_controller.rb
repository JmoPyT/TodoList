##
# Controller de l'application
class ApplicationController < ActionController::Base
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # definit la variable locale
  # soit le param passe dans url
  # soit la variable du fichier de conf
  def set_locale
    # I18n.locale = params[:locale] || I18n.default_locale
    # I18n.locale = (['fr', 'en'].include?(params[:locale])) ? params[:locale] : I18n.default_locale
    I18n.locale = (%w(fr en).include?(params[:locale])) ? params[:locale] : I18n.default_locale
  end

  # ajout la variable locale a url
  # http://localhost:3000/items/new?locale=fr
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
