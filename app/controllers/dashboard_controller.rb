class DashboardController < ApplicationController
  def index
    @trails = PaperTrail::Version.order(created_at: :desc)
  end
end
