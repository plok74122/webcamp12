namespace :dev do
  desc "重建一些假資料"
  task :rebuild => ["db:reset", :fake]
  task :fake do
    500.times do
      Event.create(:name => Faker::Name.name, :description => Faker::Lorem.paragraph, :capacity => (1..50).to_a.sample)
    end
    puts "finish"
  end
end