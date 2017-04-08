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

SiteContent.where(page: 'index').where(index: [0, 1]).destroy_all

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

association2 = OfficialAssociation.create(name: 'Evil America',
                                          acronym: 'ELMA', sport: sport)

association3 = OfficialAssociation.create(name: 'none',
                                          acronym: 'none', sport: sport)

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

def generate_postal
  "A#{Faker::Number.digit}B"\
  "#{Faker::Number.digit}C#{Faker::Number.digit}"
end

250.times do |c|
  address = Address.create(city: Faker::Address.city,
                           street: Faker::Address.street_name,
                           street_number: Faker::Number.between(1, 999).to_i,
                           postal_code: generate_postal,
                           notes: c,
                           province: mb)

  name = Faker::Name.name
  user = User.new(address: address,
                  name: name,
                  user_name: c,
                  email: "#{name.delete ' '}@example.com",
                  birthday: Faker::Date.birthday,
                  password: 'superduperpassword',
                  password_confirmation: 'superduperpassword')

  user.official_association = if c < 100
                                association3
                              elsif c < 150
                                association2
                              else
                                association
                              end

  user.permission = if c == 1 || c == 101 || c == 151
                      100
                    elsif c == 10 || c == 111 || c == 161
                      10
                    elsif c < 100
                      0
                    else
                      1
                    end
  user.save!
end
