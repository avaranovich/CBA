# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name == 'system.indexes'}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Andreas Altendorfer', :email => 'andi@altendorfer.at', :password => 'pleasechange', :password_confirmation => 'pleasechange'
puts 'New user created: ' << user.name
