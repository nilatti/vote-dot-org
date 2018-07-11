FactoryBot.define do
  factory :address do
    # 129 W 81st St Apt 5A, New York, NY 10024
    factory :address_apartment do
      street_address '129 W 81st St S Apt 3A'
      city 'New York'
      state 'NY'
      zip_code '10024-2313'
    end
    factory :address_apartment_invalid do
      street_address '129 W 81st St S Apt'
      city 'New York'
      state 'NY'
      zip_code '10024-2313'
    end
    factory :address_lobby do
      street_address '129 W 81st St S Lobby'
      city 'New York'
      state 'NY'
      zip_code '10024-2313'
    end

    factory :address_ny do
      house_number '129'
      street_predirection 'W'
      street_name '81st'
      street_type 'St'
      unit_type 'Apt'
      unit_number '5A'
      city 'New York'
      state 'NY'
      zip_5 '10024'
    end

    factory :address_spaces do
      street_address "123 St. Ann's Place"
      city 'New York'
      state 'NY'
      zip_5 '10024'
    end

    factory :address_zip_four do
      house_number '129'
      street_predirection 'W'
      street_name '81st'
      street_type 'St'
      unit_type 'Apt'
      unit_number '5A'
      city 'New York'
      state 'NY'
      zip_code '10024-2313'
    end

    factory :address_directional do
      street_address "132 South East 4132nd Street North"
      city 'New York'
      state 'NY'
      zip_5 '10024'
    end

    factory :address_directional_confusion do
      street_address "132 North South Street"
      city 'New York'
      state 'NY'
      zip_5 '10024'
    end

    factory :address_simple do
      street_address "2303 Shoreshill Rd"
      city 'Dayton'
      state 'VA'
      zip_5 '22821'
    end
  end
end
