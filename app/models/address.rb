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
    return a + " " + b
  end

  def parse_street_address # I did have some code that upcased the whole address and removed extraneous spaces bc this is what USPS says they prefer, but the upcasing was making a test fail.
    street_types = STREET_TYPES.join("|")
    directions = DIRECTIONS.join("|")
    units_not_requiring_numbers = UNITS_NOT_REQUIRING_NUMBERS.join("|")
    set_house_number
    set_street_name_and_street_type
    set_predirection
    set_postdirection
    set_unit_type
    if self.unit_type
      set_unit_number
    end
  end

  def parse_zip_code
    self.zip_code.match(/^(\d{5})(\-(\d{4}))*/)
    self.zip_5 = $1
    self.zip_4 = $3
  end

  def set_house_number
    street_address.match(/^(\d+)\s/)
    self.house_number = $1
  end

  def set_predirection #some confusing stuff here. Need to account for addresses like "1079 North Road"
    directions = DIRECTIONS.join("|")

    if street_address.match(/(#{directions})\s(#{directions})\s#{self.street_type}/i)
      self.street_predirection = $1
      self.street_name = $2
    elsif street_address.match(/#{self.house_number}\s(#{directions})\s#{self.street_type}/i)
      self.street_name = $1
    elsif  street_name.match(/^(#{directions})*\s*(#{directions})*\s/i)
      if $1 && $2
        self.street_predirection = group_directions($1, $2)
      else
        self.street_predirection = $1
      end
    end
  end

  def set_postdirection
    directions = DIRECTIONS.join("|")
    street_address.match(/#{self.street_type}\s*(#{directions})*\s*(#{directions})*/i)
    if $1 && $2
      self.street_postdirection = group_directions($1, $2)
    else
      self.street_postdirection = $1
    end
  end

  def set_street_name_and_street_type
    street_types = STREET_TYPES.join("|")
    directions = DIRECTIONS.join("|")
    street_address.match(/\s([a-zA-Z0-9\.\'\s]*)\s(#{street_types})/i)
    self.street_name = $1
    self.street_type = $2
  end

  def set_unit_number
    street_address.match(/#{self.street_name}\s#{self.street_type}\s#{self.street_postdirection}\s*#{self.unit_type}\s*([a-zA-Z0-9\.]*)/i)
    self.unit_number = $1
  end

  def set_unit_type
    unit_types = UNITS_NOT_REQUIRING_NUMBERS.concat(UNITS_REQUIRING_NUMBERS)
    unit_types_string = unit_types.join("|")
    street_address.match(/#{self.street_name}\s#{self.street_type}\s#{self.street_postdirection}\s*(#{unit_types_string})*/i)
    self.unit_type = $1
  end

  def to_s
    string = "#{self.house_number} #{self.street_predirection} #{self.street_name} #{self.street_type} #{self.street_postdirection} #{self.unit_type} #{self.unit_number}, #{self.city}, #{self.state} #{self.zip_5}"
    string.gsub!(/\s{2,}/," ")
  end

end
