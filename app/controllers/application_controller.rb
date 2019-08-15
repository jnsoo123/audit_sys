class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end
end
