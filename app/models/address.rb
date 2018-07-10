class Address < ApplicationRecord
  attr_accessor(:zip_code, :street_address)

  before_save :regularize_text, :parse_zip_code, :parse_street_address

  def get_house_number
    return self.street_address.match(/^\d+/).to_s
  end

  def get_street_name
    self.street_address.match(/^\d+\s([a-zA-Z0-9\s\.\']+)\s#{STREET_TYPES}/)
    return $1
  end
  def get_zip_4
    self.zip_code.match(/^\d{5}\-(\d{4})/)
    return $1.to_s
  end

  def get_zip_5
    return self.zip_code.match(/^\d{5}/).to_s
  end

  def group_directions(a, b)
    unless (a == 'NORTH' && b == 'SOUTH') || (a == 'SOUTH' && b == 'NORTH') || (a == 'EAST' && b == 'WEST') || (a == 'WEST' && b == 'EAST')
      puts a + " " + b
    end
  end

  def sub_directions
  end
  def parse_street_address
    street_types = STREET_TYPES.join("|")
    directions = DIRECTIONS.join("|")
    self.street_address.match(/^(\d+)\s(#{directions})*\s*(#{directions})*\s([a-zA-Z0-9\s\.\']+)(#{street_types})\s*(#{directions})*\s*(#{directions})*/)
    self.street_name = $4
    self.house_number = $1
    if $2 && $3
      self.street_predirection = group_directions($2, $3)
    end
    puts "house number: #{$1}"
    puts "predirections 1: #{$2}"
    puts "predirections 2: #{$3}"
    puts "street name: #{$4}"
    puts "street type: #{$5}"
    puts "postdirections 1: #{$6}"
    puts "postdirections 2: #{$7}"
    # self.house_number = $1
    # puts "house number: #{$1}"
    # puts "street predirection: #{$2} #{$3}"
    # # self.street_predirection = $2
    # self.street_name = $6
    # puts "street name: #{$6}"
    # self.street_type = $7
    # puts "street type: #{$7}"
    # puts "street postdirection: #{8}"
    # # self.street_predirection = get_street_predirection
    # self.street_postdirection = get_street_postdirection
    # self.unit_number = get_unit_number
    # self.unit_type = get_unit_type
    # self.county = get_county
  end

  def parse_zip_code
    self.zip_5 = get_zip_5
    self.zip_4 = get_zip_4
  end

  def regularize_text
    self.street_address.upcase!.gsub!(/\s{2,}/," ")
    self.city.upcase!.gsub!(/\s{2,}/," ")
  end

  def to_s
    # TODO: override the to_s method so that it prints out the address components as follows
    # house_number street_name street_predirection street_type street_postdirection unit_type unit_number, city, state, zip_5
  end
end
