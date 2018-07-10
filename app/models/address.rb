class Address < ApplicationRecord
  attr_accessor(:zip_code, :street_address)

  before_validation :check_zip_code, :check_street_address, :to_s

  validates :zip_5, presence: true, length: { is: 5 }

  def check_street_address
    if self.street_address
      parse_street_address
    end
  end
  def check_zip_code
    if self.zip_code
      parse_zip_code
    end
  end
  def group_directions(a, b)
    puts "grouping directions"
    unless (a == 'NORTH' && b == 'SOUTH') || (a == 'SOUTH' && b == 'NORTH') || (a == 'EAST' && b == 'WEST') || (a == 'WEST' && b == 'EAST')
      return a + " " + b
    end
  end

  def parse_street_address
    puts "parsing street address"
    puts self.street_address
    street_types = STREET_TYPES.join("|")
    directions = DIRECTIONS.join("|")

    # self.street_address.match(/^(\d+)\s(#{directions})*\s*(#{directions})*\s*([a-zA-Z0-9\s\.\']+)\s(#{street_types})\s(#{directions})*\s(#{directions})*$/)
    self.street_address.match(/^(\d+)\s(#{directions})*\s*(#{directions})*\s*([a-zA-Z0-9\s\.\']+)\s(#{street_types})\s(#{directions})*\s*(#{directions})*$/i)
    self.house_number = $1
    puts "house number"
    puts self.house_number
    puts "predirections"
    puts $2
    puts $3
    puts "street name"
    puts $4
    if $2 && $3
      self.street_predirection = group_directions($2, $3)
    else
      self.street_predirection = $2
    end
    puts "predirection"
    puts self.street_predirection
    self.street_name = $4
    self.street_type = $5
    if $6 && $7
      self.street_postdirection = group_directions($6, $7)
    else
      self.street_postdirection = $6
    end
    # puts "number #{self.house_number} predirection #{self.street_predirection} street name #{self.street_name} street type: #{self.street_type} postdirection: #{self.street_postdirection}"
    # self.unit_number = get_unit_number
    # self.unit_type = get_unit_type
    # self.county = get_county
  end

  def parse_zip_code
    self.zip_code.match(/^(\d{5})(\-(\d{4}))*/)
    self.zip_5 = $1
    self.zip_4 = $3
  end

  # def regularize_text
  #   self.street_address.upcase!.gsub!(/\s{2,}/,' ')
  # end

  def to_s
    # TODO: override the to_s method so that it prints out the address components as follows
    # house_number street_name street_predirection street_type street_postdirection unit_type unit_number, city, state, zip_5
    return "#{self.house_number} #{self.street_name} #{self.street_predirection} #{self.street_type} #{self.street_postdirection} #{self.unit_type} #{self.unit_number}, #{self.city}, #{self.state}, #{self.zip_5}"
  end

end
