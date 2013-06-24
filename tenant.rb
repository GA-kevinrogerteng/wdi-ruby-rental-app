class Tenant
  attr_accessor :name, :phone, :lease_end, :unit

  def initialize(name, phone, unit)
    @name = name
    @phone = phone
    @unit = unit
  end

end
