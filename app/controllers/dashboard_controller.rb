class DashboardController < ApplicationController
  def index
    deltek = Deltek.project("06405.00.E")
    @deltek = [deltek]

    @deltek.each do |project|
      project_manager = Deltek.employee(project[:proj_mgr]).values_at(:first_name,
                                                                     :last_name,
                                                                     :e_mail)

      project[:proj_mgr_name] = project_manager[0..1].join(" ")
      project[:proj_mgr_email] = project_manager[2]
      project[:budget_remaining] = project[:total_project_cost].to_f - project[:firm_cost].to_f
      project[:percentage_budget_remaining] = (project[:budget_remaining].to_f / project[:total_project_cost].to_f * 100).round(2)
    end
  end
end
