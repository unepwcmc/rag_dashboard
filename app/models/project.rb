class Project < ActiveRecord::Base
  def budget_remaining
    budget = self.data["total_project_cost"].to_f
    staff_cost = self.data["firm_cost"].to_f

    budget - staff_cost
  end

  def percentage_budget_remaining
    (self.budget_remaining / self.data["total_project_cost"].to_f * 100).round(2)
  end
end
