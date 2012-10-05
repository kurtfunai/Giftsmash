class ApplicationController < ActionController::Base
  protect_from_forgery
  #check_authorization :unless => :devise_controller?
  def after_sign_in_path_for(resource)
    
    lists_path
    #request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
