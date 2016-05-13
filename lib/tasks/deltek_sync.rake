namespace :deltek do
  desc "Sync Projects from Deltek to local database"
  task sync: :environment do
    Rake::Task["deltek:projects"].invoke
    Rake::Task["deltek:clients"].invoke
    Rake::Task["deltek:employees"].invoke
  end

  task projects: :environment do
    projects = Deltek.projects(10000, 0)
    projects.each do |p|
      Project.create(data: p)
    end
  end

  task clients: :environment do
    clients = Deltek.clients(10000, 0)
    clients.each do |c|
      Client.create(data: c)
    end
  end

  task employees: :environment do
    employees = Deltek.employees(10000, 0)
    employees.each do |e|
      Employee.create(data: e)
    end
  end
end
