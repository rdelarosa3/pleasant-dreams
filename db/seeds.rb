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
      business['phone'] = "+1(210)507-2502"
      business['messenger'] = 'PleasantDreamsCO'
      business['zipcode'] = 78214
      business['email'] = "info@pleasant-dreams.com"
      business['operator'] = "Richard Lopez"
      business['twitter'] = 'https://www.twitter.com/'
      business['instagram'] = 'https://www.instagram.com/richardbiglopez'
      business['facebook'] = 'https://www.facebook.com/BIG7395REWK'
      business['youtube'] = 'https://www.youtube.com/'
      business['hashtag'] = 'pleasantdreamsco'
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

    user['first_name'] = 'Robert'
    user['last_name'] = 'Delarosa'
    user['email'] = "rdelarosa39@gmail.com"
    user['role'] = 2
    user['password'] = 'admin'
    user['hashtag'] = 'khmergirl'
    # user['phone_number'] = "+1 (210) 802-8403"
    user['bio'] = 'Computer Programmer'
    User.create(user)

end 

ActiveRecord::Base.transaction do

    user['first_name'] = 'Richard'
    user['last_name'] = 'Lopez'
    user['email'] = "richard@email.com"
    user['role'] = 1
    user['title'] = Title.find(3)
    user['password'] = '12345'
    user['hashtag'] = 'pleasantdreamsco'
    user['phone_number'] = "+1 (210) 254-3432"
    user['bio'] = 'Richard is a tattoo, mural and graffiti artist . He trained at the International Academy of Design and Technology before becoming a full time tattoo artist.'
    User.create(user)

end 
ActiveRecord::Base.transaction do

    user['first_name'] = 'Mayra'
    user['last_name'] = 'Neaves'
    user['email'] = "myneaves@gmail.com"
    user['role'] = 1
    user['title'] = Title.find(4)
    user['password'] = 'admin'
    user['hashtag'] = 'baseball'
    user['phone_number'] = "+1 (210) 923-1894"
    user['bio'] = 'Mayra is a sexy bitch.'
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


