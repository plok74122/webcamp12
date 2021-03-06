namespace :dev do
  desc "重建一些假資料"
  task :rebuild => ["db:reset", :fake]
  task :fake => :environment do
    Group.create(:name => "Ruby")
    Group.create(:name => "Javascript")
    Group.create(:name => "PHP")
    Group.create(:name => ".Net")
    Category.create(:name => "Category 1")
    Category.create(:name => "Category 2")
    Category.create(:name => "Category 3")
    Category.create(:name => "Category 4")
    50.times do
      @event = Event.create(:name => Faker::Pokemon.name,
                            :description => Faker::Lorem.paragraph,
                            :capacity => (1..50).to_a.sample,
                            :is_public => [true, false].sample,
                            :category => Category.all.sample)
      (0..20).to_a.sample.times do
        @event.attendees.create(:username => Faker::Name.name)
      end
      @event.create_location(:name => Faker::Address.city)
      @event.group_ids = Group.all.map { |g| g.id if [true, false].sample }.compact
    end
    puts "finish"
  end
end