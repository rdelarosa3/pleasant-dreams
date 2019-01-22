# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
business = {}


ActiveRecord::Base.transaction do
      business['name'] = "Pleasant Dreams Co."
      business['street'] = "2931 Roosevelt Ave"
      business['city'] = "San Antonio"
      business['state'] = "TX"
      business['country'] = "USA"
      business['phone'] = "+1 (210) 923-1894"
      business['zipcode'] = 78214
      business['email'] = "info@pleasant-dreams.com"
      business['operator'] = "Richard Lopez"
      business['twitter'] = 'https://www.twitter.com/'
      business['instagram'] = 'https://www.instagram.com/richardbiglopez'
      business['facebook'] = 'https://www.facebook.com/BIG7395REWK'
      business['youtube'] = 'https://www.youtube.com/'
      business['hashtag'] = 'tattoo'
      business['bio'] = 'Pleasant Dreams offers top quality work. All artists are trained in best and safe practices to ensure the safety of all of our clients.'
      business['tattoo'] ='From grayscale to full color, Reworks and Cover-ups, we do it all. Express yourself with a custom tattoo.'
      business['piercing'] = 'Piercing services coming soon.'
      business['product'] = 'Tattoo Supplies, Tattoo Needles, Tattoo Equipment, Tattoo Tubes, Tattoo Inks,Piercing Supplies, and more.'
      Business.create(business)
end

hours = {}
opening = Time.utc(2000,"jan",1,9,30,0)
closing = Time.utc(2000,"jan",1,19,00,0)
days = [0,1,2,3,4,5,6]

ActiveRecord::Base.transaction do
	days.length.times do
		hours['business_id'] = 1
		hours['day'] = days.pop
		hours['open_time'] = opening.strftime("%H:%M")
		hours['close_time'] = closing.strftime("%H:%M")
		BusinessHour.create(hours)
	end
end 

title = {}
titles =  ["Artist", "Senior Artist", "Operator","Receptionist"]

ActiveRecord::Base.transaction do
	titles.length.times do
		title['name'] = titles.pop
		Title.create(title)
	end 
end	


user = {}


ActiveRecord::Base.transaction do

    user['first_name'] = 'admin'
    user['last_name'] = 'admin'
    user['email'] = "admin@admin.com"
    user['role'] = 2
    user['password'] = 'admin'
    user['hashtag'] = 'pleasantdreamsco'
    user['phone_number'] = "+1 (210) 923-1894"
    user['bio'] = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit.m.'
    User.create(user)

end 


service = {}
service_names = ["Qtr Sleeve Grayscale","Qtr Sleeve Color","Half Sleeve Grayscale","Half Sleeve Color","Full Sleeve Grayscale","Full Sleeve Color","Cover-ups","2x3-3x5 Grayscale","3x3-3x6 Color","4x4-4x6"]
ActiveRecord::Base.transaction do
  
  service_names.length.times do
    service["name"] = service_names.pop
    # service["description"] = Faker::Hipster.sentence
    service["price"] = rand(7..50)
    service["range"] = rand(7..50)

    Service.create(service)
  end
end


