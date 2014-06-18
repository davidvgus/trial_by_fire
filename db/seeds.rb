# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#FactoryGirl.create(:user,
                   #email: "admin@test.com",
                   #user_name: "admin",
                   #password: ENV['ADMIN_PASSWORD']
                  #)

#FactoryGirl.create(:user,
                   #email: "test@test.com",
                   #user_name: "test",
                   #password: ENV['TEST_USER_PASSWORD']
                  #)

User.create(
             email: "admin@test.com",
             user_name: "admin",
             password: ENV['ADMIN_PASSWORD'],
             password: ENV['ADMIN_PASSWORD'],
             confirmed_at: Time.now )

User.create(
             email: "test_user@test.com",
             user_name: "test_user",
             password: ENV['ADMIN_PASSWORD'],
             password: ENV['ADMIN_PASSWORD'],
             confirmed_at: Time.now )
