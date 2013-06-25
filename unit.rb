class Unit
  attr_accessor :building, :number, :sqft, :rent, :tenant

  def initialize(building, number, sqft, rent, tenant = nil)
    @building = building
    @number = number
    @sqft = sqft
    @rent = rent
    @tenant = tenant
  end

  def available?
    @tenant.nil?
  end

end
