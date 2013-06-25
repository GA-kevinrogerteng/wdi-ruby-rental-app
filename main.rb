#!/usr/bin/env ruby

require 'rainbow'
require './building'
require './unit'
require './tenant'

building = Building.new("Waterfront Tower", "345 Embarcadero")

def menu message
  puts `clear`
  puts "*** Land Lord v1.0 ***\n\n"

  puts "#{message.color('#ff3300')}\n\n" unless message.empty?

  puts '1 : Add unit'
  puts '2 : Add tenant'
  puts '3 : Show all unrented units'
  puts '4 : Show tenant contacts'
  puts '5 : Show total rented sqft'
  puts '6 : Cha-ching! Show my annual income'
  puts "q : Quit\n\n"
  print '--> '.color('#ff3300')
  gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice
  when "1"
    puts "Enter unit info:"
    print "#:"; number = gets.chomp
    print "sqft:"; sqft = gets.chomp
    print "rent:"; rent = gets.chomp

    building.units << Unit.new(building, number, sqft, rent)
    message = "Added unit #{building.units.last.number}"
  when "2"
    puts "Enter tenant info:"
    print "name:"; name = gets.chomp
    print "phone:"; phone = gets.chomp
    puts "select tenant's new unit:"
    building.get_available_units.each do |unit|
      puts "#{unit.number} "
    end
    print "#:"; requested_unit_number = gets.chomp
    selected_unit = (building.units.select { |unit| unit.number == requested_unit_number}).first
    selected_unit.tenant = Tenant.new(name, phone, selected_unit)
    message = "Tenant #{selected_unit.tenant.name} moved into unit #{selected_unit.number}"
  when "3"
    available_units = building.get_available_units()
    message = "List of unrented units:\n"
    available_units.each do |unit|
      message += unit.number + " "
    end
  when "4"
    message = "Tenant contact list:\n"
    message += building.get_contact_list()
  when "5"
    message = "Total rented sqft:"
    sqft_rented = building.calc_total_sqft_rented()
    message += sqft_rented.to_s
  when "6"
    message = "Annual income:"
    total_income = building.calc_annual_income()
    message += total_income.to_s
  else
      message += "I don't understand ..."
  end
  choice = menu message
end
