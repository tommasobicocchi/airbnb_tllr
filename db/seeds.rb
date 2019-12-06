#retrieving from mapbox
require 'faker'
require 'json'
require 'open-uri'


10.times do

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
  puts faker_password
  #photo
  faker_img = "https://source.unsplash.com/900x900/?person"

  def owner_swift
    User.all.each { |user| user.flats.empty? ? false : true}
  end
  #creating_user
  User.create!(
    email: faker_email,
    password: faker_password,
    first_name: faker_first_name,
    last_name: faker_last_name,
    gender: faker_gender,
    phone_number: faker_phone_number,
    birthdate: faker_age,
    photo: faker_img,
    owner: owner_swift
    )

  #name
  faker_name = ["House ","Villa ","Apartment ","Little Villa "].sample+ (50..350).to_a.sample.to_s + " Square Meters"
#description
faker_description = "We offer you a " + Faker::House.room + ", we have also a " + Faker::House.room + ", on top of that we have a " + Faker::House.room
  #address
  faker_address = ["Via Roma, 42", "Piazza De Gasperi, 7","Via Roma, 11 Basiano","Via Duca Uberto, 5 Besate","Via G. Matteotti - Castello Visconteo","Piazza Vittorio Veneto, 16 Bubbiano"].sample
  #Mapboxtogetdata
  url = URI.encode("https://api.mapbox.com/geocoding/v5/mapbox.places/#{faker_address}.json?access_token=pk.eyJ1IjoidHllYSIsImEiOiJjazM4a2pnZTcwOW5sM2dwaTFhYnA0dHhwIn0.qUjpIALowWJUL9MLIxiqWA")
  user_serialized = open(url).read
  #latitude&longitude
  faker_latitude = JSON.parse(user_serialized)["features"].first["geometry"]["coordinates"][0]
  faker_longitude = JSON.parse(user_serialized)["features"].first["geometry"]["coordinates"][1]
  #price
  faker_daily_price = (50..350).to_a.sample
  #img_house
  faker_img_house = "https://source.unsplash.com/900x900/?apartment"

  user = (User.all).sample.id

  Flat.create!(
    name: faker_name,
    description: faker_description,
    daily_price: faker_daily_price,
    address: faker_address,
    latitude: faker_latitude,
    longitude: faker_longitude,
    user_id: (User.all).sample.id
    )

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
    break if create_datetime_checkout > create_datetime_checkin
  end
  #check_in
  faker_check_in_date = create_datetime_checkin()
  #check_out
  faker_check_out_date = create_datetime_checkout()
  #create_booking

  def owner_swift
    User.all.each { |user| user.flats.empty? ? false : true}
  end

  def review_generator(x)
      if x == 5
        return "Great Experience!"
      elsif x == 4
        return "Quite good, but not the best..."
      elsif x == 3
        return "Just ok, I was expecting more."
      elsif x == 2
        return "This was unacceptable, terrible host."
      elsif x == 1
        return "Avoid at all costs!"
      end
  end


    Booking.create!(
      checkin_date: faker_check_in_date,
      checkout_date: faker_check_out_date,
      user_id: faker_daily_price,
      flat_id: (Flat.all).sample.id,
      user_id: (User.all).sample.id
      )

    Review.create!(
      rating: fake_rating,
      description: review_generator(fake_rating),
      booking_id: (Booking.all).sample.id
      )
  end


