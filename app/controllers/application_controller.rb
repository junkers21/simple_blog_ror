class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_timezone

  def set_locale
    I18n.locale = :en
  end

  def set_timezone
    Time.zone = "Europe/Paris"
  end

end
