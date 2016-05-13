class Employee < ActiveRecord::Base
  def full_name
    "#{self.data["first_name"]} #{self.data["last_name"]}"
  end
end
