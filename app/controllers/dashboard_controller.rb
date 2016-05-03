class DashboardController < ApplicationController
  def index
    deltek = init_deltek
    projects = deltek.projects
  end

  private
    def init_deltek
      Deltek.new(Rails.application.secrets.deltek['wsdl'],
                  Rails.application.secrets.deltek['username'],
                  Rails.application.secrets.deltek['password'],
                  Rails.application.secrets.deltek['database_name'])
    end
end
