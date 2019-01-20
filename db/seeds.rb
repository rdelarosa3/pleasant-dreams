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
      Business.create(business)
end

hours = {}
opening = Time.utc(2000,"jan",1,9,30,0)
closing = Time.utc(2000,"jan",1,19,00,0)
days = [1,2,3,4,5,6]
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
titles =  ["Artist", "Senior Artist", "Makeup Artist","Receptionist"]

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
    user['birthday'] = Date.today
    user['password'] = 'admin'
    User.create(user)

end 