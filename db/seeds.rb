# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Comments
Comment.delete_all

#Stages
Stage.delete_all

#Days
Day.delete_all


#Bands
Show.delete_all

#Notification
Notification.delete_all

#Festivals
Festival.delete_all

optimus = Festival.create([{name: 'Optimus Alive', coord: '45 64', tickets: '45', transports: 'nao sei'}])

day1 = Day.create(day: DateTime.parse("09/01/2009"), time: Time.parse("12:00"))


