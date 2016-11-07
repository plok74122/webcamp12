namespace :dev do
  desc "重建一些假資料"
  task :rebuild => ["db:reset", :fake]
  task :fake => :environment do
    15.times do
      @event = Event.create(:name => Faker::Name.name,
                            :description => Faker::Lorem.paragraph,
                            :capacity => (1..50).to_a.sample,
                            :is_public => [true, false].sample)
      (0..20).to_a.sample.times do
        @event.attendees.create(:username => Faker::Name.name)
      end
    end
    puts "finish"
  end
end