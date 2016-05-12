namespace :deltek do
  desc "Sync Projects from Deltek to database"
  task sync: :environment do
    offset = 0
    amount = 10

    loop do
      projects = Deltek.projects(amount, offset)

      projects.each do |p|
        Project.create(data: p)
      end

      offset += amount

      puts offset
      puts projects.count


      break

      #break if projects.count < amount
      #offset += amount
    end
  end

end
