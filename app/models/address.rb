class Address < ApplicationRecord
  attr_accessor(:zip_code, :street_address)

  before_save :parse_zip_code, :parse_street_address

  def get_zip_4
    self.zip_code.match(/^\d{5}\-(\d{4})/)
    return $1.to_s
  end

  def get_zip_5
    return self.zip_code.match(/^\d{5}/).to_s
  end

  def parse_street_address
    self.house_number = get_house_number
    self.street_name = get_street_name
    self.street_type = get_street_type
    self.street_predirection = get_street_predirection
    self.street_postdirection = get_street_postdirection
    self.unit_number = get_unit_number
    self.unit_type = get_unit_type
    self.county = get_county
  end

  def parse_zip_code
    self.zip_5 = get_zip_5
    self.zip_4 = get_zip_4
  end

  def to_s
    # TODO: override the to_s method so that it prints out the address components as follows
    # house_number street_name street_predirection street_type street_postdirection unit_type unit_number, city, state, zip_5
  end
end
