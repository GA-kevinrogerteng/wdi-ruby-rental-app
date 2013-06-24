#!/usr/bin/env ruby

require 'rainbow'
require './building'
require './unit'
require './tenant'

building = Building.new("Waterfront Tower", "345 Embarcadero")

$message = ""

def menu
  puts `clear`
  puts "*** Land Lord v1.0 ***\n\n"

  puts "#{$message.color('#ff3300')}\n\n" unless $message.empty?

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


choice = menu
while choice != 'q'
  case choice
  when "1"
    puts "Enter unit info:"
    print "#:"; number = gets.chomp
    print "sqft:"; sqft = gets.chomp
    print "rent:"; rent = gets.chomp

    building.units << Unit.new(building, number, sqft, rent)
    $message = "Added unit #{building.units.last.number}"
  when "2"
    puts "Enter tenant info:"
    print "name:"; name = gets.chomp
    print "phone:"; phone = gets.chomp
    puts "select tenant's new unit:"
    building.units.each do |unit|
      puts "#{unit.number} "
    end
    print "#:"; number = gets.chomp
    selected_unit = (building.units.select { |u| u.number == number}).first
    selected_unit.tenant = Tenant.new(name, phone, selected_unit)
    $message = "Tenant #{building.units.last.tenant.name} moved into unit #{selected_unit.number}"
  when "3"
    available_units = building.get_available_units()
    $message = "Here's a list of all available units:\n"
    available_units.each do |unit|
      $message += unit.number + " "
    end
  when "4"
    $message = "Tenant contact list:\n"
    $message += building.get_contact_list()
  when "5"
    $message = "Total rented sqft:"
    sqft_rented = building.calc_total_sqft_rented()
    $message += sqft_rented.to_s
  when "6"
    $message = "Annual income:"
    total_income = building.calc_total_sqft_rented()
    $message += total_income.to_s
  else
      "I don't understand ..."
  end
  choice = menu
end
