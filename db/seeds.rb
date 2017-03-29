# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.destroy_all
AdminUser.create!(email: 'wilsonthehungryman@gmail.com',
                  password: 'andhebelike,passwordISpassword',
                  password_confirmation: 'andhebelike,passwordISpassword')

Country.destroy_all
canada = Country.create(name: 'Canada', abbreviation: 'CAN')

Province.destroy_all
mb = Province.create(name: 'Manitoba', abbreviation: 'MB', country: canada)

Province.create(name: 'Alberta', abbreviation: 'AB', country: canada)
Province.create(name: 'Ontario', abbreviation: 'ON', country: canada)
Province.create(name: 'British Columbia', abbreviation: 'BC', country: canada)

Address.destroy_all
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

address = Address.create(city: 'Brandon',
                         street: 'Corydon',
                         street_number: '999',
                         postal_code: 'a1a1a1',
                         province: mb)

Sport.destroy_all
sport = Sport.create(name: 'Volleyball')

Sport.create(name: 'BaseBall')

OfficialAssociation.destroy_all
association = OfficialAssociation
              .create(name: 'Manitoba Volleyball Officials Association',
                      acronym: 'MVOA', sport: sport)

OfficialAssociation.create(name: 'Evil America', acronym: 'ELMA', sport: sport)

League.destroy_all
league = League.create(name: 'Winnipeg Coed Volleyball League',
                       acronym: 'WCVL',
                       female: true,
                       male: true,
                       age_min: 16,
                       sport: sport,
                       official_association: association)

Arena.destroy_all
arena = Arena.create(name: 'Court of Doom',
                     court_identifier: 'where the floor used to be',
                     address: address)

Game.destroy_all
Game.create(date: Time.now,
            away: 'not home',
            home: 'homey',
            league: league,
            sport: sport,
            arena: arena)
