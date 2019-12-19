# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

flyers = [{:title => 'Christmas Kickoff', :location => 'HRBB 310', :event_date => '25-Nov-2020 12:30:00', :uploader => "seed", :display_date => '10-Nov-2019', :image_file => "ChristmasKick.png", :is_live => '1', :custFlyer => '3', :defaultBg => ""},
    	  {:title => 'Weekend Kickoff', :location => 'the streets', :event_date => '15-Sept-2020', :uploader => "seed", :display_date => '10-Nov-2019', :image_file => "Weekend Kickoff Flyer 09-15-17.jpg", :is_live => '1', :custFlyer => '3', :defaultBg => ""},
    	  {:title => 'Weekend Kickoff', :location => 'the bedroom', :event_date => '26-Oct-2018', :uploader => "seed", :display_date => '10-Nov-2019', :image_file => "Weekend Kickoff Flyer 10_26_18.png", :is_live => '0', :custFlyer => '3', :defaultBg => ""},
  	 ]

flyers.each do |flyer|
  Flyer.create!(flyer)
end

User.create!(
    email:  "csegsa.news@gmail.com",
    password: "g1gEmAg$"
  )

