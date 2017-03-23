# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'wilsonthehungryman@gmail.com',
                  password: 'andhebelike,passwordISpassword',
                  password_confirmation: 'andhebelike,passwordISpassword')
canada = Country.create(name: 'Canada', abbreviation: 'CAN')

mb = Province.create(name: 'mb', abbreviation: 'MB', country: canada)

Province.create(name: 'Alberta', abbreviation: 'AB', country: canada)
Province.create(name: 'Ontario', abbreviation: 'ON', country: canada)
Province.create(name: 'British Columbia', abbreviation: 'BC', country: canada)

Address.create(city: 'Winnipeg',
               street: 'Harvard Ave.',
               street_number: '246',
               postal_code: 'R3M 0K7',
               province: mb)

Address.create(city: 'Winnipeg',
               street: 'Yale Ave.',
               street_number: '246',
               postal_code: 't3a 0K7',
               province: mb)

Address.create(city: 'Brandon',
               street: 'Corydon',
               street_number: '999',
               postal_code: 'a1a1a1',
               province: mb)
