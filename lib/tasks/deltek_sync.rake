namespace :deltek do
  desc "Sync Projects from Deltek to local database"
  task sync: :environment do
    # Pull 10 projects, add them to the db if they don't exist, add a +10 offset and repeat until you return a batch of projects less than 10 in size
    offset = 0
    amount = 10

    puts "Adding Projects..."

    loop do
      projects = Deltek.projects(amount, offset)
      projects.each do |p|
        Project.create(data: p)
      end
      break if projects.count < amount
      offset += amount
    end

    puts "Done! \nAdding Clients..."

    offset = 0

    loop do
      clients = Deltek.clients(amount, offset)
      clients.each do |c|
        Client.create(data: c)
      end
      break if clients.count < amount
      offset += amount
    end

    puts "Done!"
  end
end
