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
    # add code to create unit
    $message = "Added unit ...."
  when "2"
    # add code to create tenant and assign to unit
    $message = "Added tenant .... to unit ..."
  when "3"
    available_units = building.get_available_units()
    $message = "List of all available units:\n"
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
