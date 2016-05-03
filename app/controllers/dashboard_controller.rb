class DashboardController < ApplicationController
  def index
    deltek = init_deltek
    projects = deltek.projects(10, 10)
  end

  private
    def init_deltek
      Deltek.config(Rails.application.secrets.deltek['wsdl'],
                  Rails.application.secrets.deltek['username'],
                  Rails.application.secrets.deltek['password'],
                  Rails.application.secrets.deltek['database_name'])
    end
end
