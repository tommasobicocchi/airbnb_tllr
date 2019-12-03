#retrieving from mapbox
require 'faker'
require 'json'
require 'open-uri'


array_fake_address = []
1.times do
  #address
  faker_address = Faker::Address.street_address.to_s

  #Mapboxtogetdata
  url = URI.encode("https://api.mapbox.com/geocoding/v5/mapbox.places/#{faker_address}.json?access_token=pk.eyJ1IjoidHllYSIsImEiOiJjazM4a2pnZTcwOW5sM2dwaTFhYnA0dHhwIn0.qUjpIALowWJUL9MLIxiqWA")
  user_serialized = open(url).read
  #latitude&longitude
  latitude = JSON.parse(user_serialized)["features"].first["geometry"]["coordinates"][0]
  longitude = JSON.parse(user_serialized)["features"].first["geometry"]["coordinates"][1]
  #price
  faker_daily_price = [50...350].sample
  #img_house
  faker_img_house = "https://source.unsplash.com/1600x900/?apartment"




#email
faker_email = Faker::Internet.email
puts faker_email
#gender
  faker_gender = Faker::Gender.binary_type
  if faker_gender == "Female"
  #name
  faker_first_name = Faker::Name.male_first_name
else
  faker_first_name = Faker::Name.female_first_name
end
  #lastname
  faker_last_name = Faker::Name.last_name
  #phonenumber
  faker_phone_number = Faker::PhoneNumber.phone_number
  #birthdate
  faker_age = Faker::Date.in_date_period(year: rand(1930...2000).to_i)
  #owner
  faker_owner = [true, false].sample
  puts faker_owner
  #password
  faker_password = Faker::WorldCup
  #photo
  faker_img = "https://source.unsplash.com/1600x900/?person"

  #creating_user
  a = User.create!(
    email: faker_email,
    password: faker_password,
    name: faker_first_name,
    last_name: faker_last_name,
    gender: faker_gender,
    phone_number: faker_phone_number,
    birthdate: faker_age,
    photo: faker_img,
    owner: faker_owner
     )

  puts a

  #rating
  fake_rating = rand(1...5).to_i
  #check_in_date_check_out_date
  loop do
    def create_datetime_checkin
      random_year = rand(2020..2022)
      random_month = rand(1..12)
      random_day  = rand(1..30)
      Date.new(random_year,random_month,random_day)
    end
    def create_datetime_checkout
      random_year = rand(2020..2022)
      random_month = rand(1..12)
      random_day  = rand(1..30)
      Date.new(random_year,random_month,random_day)
    end
    break if create_datetime_checkout() > create_datetime_checkin()
  end
  #check_in
  faker_check_in_date = create_datetime_checkin()
  #check_out
  faker_check_out_date = create_datetime_checkout()
  #create_booking
end


