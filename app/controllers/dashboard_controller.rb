class DashboardController < ApplicationController
  def index
    @trails = PaperTrail::Version.all
  end
end
