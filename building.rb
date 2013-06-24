class Building
  attr_accessor :name, :address, :units

  def initialize(name, address)
    @name = name
    @address = address
    @units = []
  end

  def get_contact_list
    contact_list_str = ""
    @units.each do |unit|
      if not unit.tenant.nil?
         contact_list_str += unit.tenant.name + " " + unit.tenant.phone
      end
    end
    contact_list_str
  end

  def calc_total_sqft_rented
    rented_units = rented_units()
    if not rented_units.empty?
      return rented_units.inject(0) { |total_sqft, unit|
        total_sqft + unit.sqft.to_i
      }
    end
  end

  def calc_annual_income
    rented_units = rented_units()
    if not rented_units.empty?
      return rented_units.inject(0) { |total_income, unit|
        total_income + unit.rent.to_i
      }
    end
  end

  def get_available_units
    @units.select do |unit|
        unit.available?
    end
  end

  def rented_units
    return @units.select do |unit|
      not unit.available?
    end
  end


end
