class DashboardController < ApplicationController
  def index
    @deltek = Deltek.projects(25)
  end
end
