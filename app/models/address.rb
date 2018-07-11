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
    puts self.street_address
    if a.match(/east/i) && b.match(/west/i)
      puts "opposing directions"
      self.street_name = b + " " + self.street_name
      return a
    else
      return a + " " + b
    end
  end

  def parse_street_address # I did have some code that upcased the whole address and removed extraneous spaces bc this is what USPS says they prefer, but the upcasing was making a test fail.
    street_types = STREET_TYPES.join("|")
    directions = DIRECTIONS.join("|")
    units_not_requiring_numbers = UNITS_NOT_REQUIRING_NUMBERS.join("|")

    self.street_address.match(/^(\d+)\s*(#{directions})*\s*(#{directions})*\s([a-zA-Z0-9\.\']*)\s(#{street_types})\s*(#{directions})*\s*(#{directions})*$/i)
    self.house_number = $1
    self.street_name = $4
    if $2 && $3
      self.street_predirection = group_directions($2, $3)
    else
      self.street_predirection = $2
    end

    self.street_type = $5

    if $6 && $7
      self.street_postdirection = group_directions($6, $7)
    else
      self.street_postdirection = $6
    end
    self.unit_type = $8
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
