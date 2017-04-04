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
Game.destroy_all
Arena.destroy_all
League.destroy_all
User.destroy_all
OfficialAssociation.destroy_all
Sport.destroy_all
Address.destroy_all
Province.destroy_all
Country.destroy_all
SiteContent.where(page: 'index').where(index: [0,1]).destroy_all


AdminUser.create!(email: 'wilsonthehungryman@gmail.com',
                  password: 'andhebelike,passwordISpassword',
                  password_confirmation: 'andhebelike,passwordISpassword')

canada = Country.create(name: 'Canada', abbreviation: 'CAN')

mb = Province.create(name: 'Manitoba', abbreviation: 'MB', country: canada)

Province.create(name: 'Alberta', abbreviation: 'AB', country: canada)
Province.create(name: 'Ontario', abbreviation: 'ON', country: canada)
Province.create(name: 'British Columbia', abbreviation: 'BC', country: canada)

home = Address.create(city: 'Winnipeg',
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

sport = Sport.create(name: 'Volleyball')

Sport.create(name: 'BaseBall')

association = OfficialAssociation
              .create(name: 'Manitoba Volleyball Officials Association',
                      acronym: 'MVOA', sport: sport)

OfficialAssociation.create(name: 'Evil America', acronym: 'ELMA', sport: sport)

OfficialAssociation.create(name: 'none', acronym: 'none', sport: sport)

league = League.create(name: 'Winnipeg Coed Volleyball League',
                       acronym: 'WCVL',
                       female: true,
                       male: true,
                       age_min: 16,
                       sport: sport,
                       official_association: association)

arena = Arena.create(name: 'Court of Doom',
                     court_identifier: 'where the floor used to be',
                     address: address)

Game.create(date: Time.now,
            away: 'not home',
            home: 'homey',
            league: league,
            sport: sport,
            arena: arena)

User.create(name: 'Wilson Reid',
            user_name: 'wilson',
            email: 'wilsonthehungryman@gmail.com',
            password: 'simplepwd',
            password_confirmation: 'simplepwd',
            permission: 100,
            address: home)

SiteContent.create(page: 'index', index: 0, active: true,
                   content: '## First sample content')

SiteContent.create(page: 'index', index: 1, active: true,
                   content: '## This application will help assignor assign '\
                   'referees to games')
