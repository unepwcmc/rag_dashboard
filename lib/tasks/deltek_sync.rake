namespace :deltek do
  desc "Sync Projects from Deltek to local database"
  task sync: :environment do
    offset = 0
    amount = 10
    added_count = 0

    loop do
      projects = Deltek.projects(amount, offset)

      projects.each do |p|
        Project.first_or_create(data: p) do |proj|
          added_count += 1
        end
      end

      break if projects.count < amount

      offset += amount
    end

    puts "Done! Added #{added_count} Projects!"
  end
end
