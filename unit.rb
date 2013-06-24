class Unit
  attr_accessor :building, :number, :sqft, :rent, :tenant

  def initialize(building, number, sqft, rent)
    @building = building
    @number = number
    @sqft = sqft
    @rent = rent
    @tenant = nil
  end

  def available?
    @tenant.nil?
  end

end
