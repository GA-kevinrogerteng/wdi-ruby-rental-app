class Building
  attr_accessor :name, :address, :units

  def initialize(name, address, units = [])
    @name = name
    @address = address
    @units = units
  end

  def get_contact_list
    result = @units.inject("") do |contact_list_str, unit|
      if not unit.available?
         contact_list_str += "#{unit.tenant.name} p#:#{unit.tenant.phone}"
      end
    end
    result || ""
  end

  def calc_total_sqft_rented
    get_rented_units().inject(0) { |total_sqft, unit|
        total_sqft + unit.sqft.to_i
    }
  end

  def calc_annual_income
    get_rented_units().inject(0) { |total_income, unit|
        total_income + unit.rent.to_i
    }
  end

  def get_available_units
    @units.select do |unit|
        unit.available?
    end
  end

  def get_rented_units
    return @units.select do |unit|
      not unit.available?
    end
  end

end
