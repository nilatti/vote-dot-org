require 'rails_helper'

RSpec.describe Address, :type => :model do
  describe '#new' do
    context 'Given a valid address' do
      it 'can create a new address' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylavnia',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: 20500
                        )).to be_valid
      end
    end

    context 'Given bad address values' do
      it 'cannot create a new address' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylavnia',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: 123
                        )).not_to be_valid
      end
    end

    context 'Given zip plus four' do
      let(:address) { create(:address_zip_four)}
      it 'can parse first 5 digits' do
        expect(address.zip_5).to eq('10024')
      end
      it 'can parse extra 4 digits' do
        expect(address.zip_4).to eq('2313')
      end
    end

    context 'Given simple address' do
      let (:address) { create(:address_ny)}
      it 'can find the house number' do
        expect(address.house_number).to eq('129')
      end

      it 'can find the street name' do
        expect(address.street_name).to eq('81st')
      end
      it 'can find the street type' do
        expect(address.street_type).to eq('St')
      end
    end

    context 'given no directionals' do
      let (:address) { create(:address_simple)}
      it 'parses out the house number' do
        expect(address.house_number).to eq('2303')
      end
      it 'parses out the street name' do
        expect(address.street_name).to eq('Shoreshill')
      end
      it 'parses out the street type' do
        expect(address.street_type).to eq('Rd')
      end
    end

    context 'given address with spaces and apostrophes in the street name' do
      let(:address) { create(:address_spaces)}
      it 'finds the correct street name' do
        expect(address.street_name).to eq("St. Ann's")
      end
    end

    context 'given address with unit but no number required' do
      let (:address) { create(:address_lobby)}
      it 'finds the correct unit type' do
        expect(address.unit_type).to eq('Lobby')
      end
    end

    context 'given address with unit that requires number' do
      let (:address) { create(:address_apartment)}
      let (:invalid_address) { create(:address_apartment_invalid)}
      it 'finds the correct unit type' do
        expect(address.unit_type).to eq('Apt')
      end
      it 'declares address invalid if it lacks required number' do
        expect(invalid_address).not_to be_valid
      end
    end

    context 'Given multiple pre and post directions' do
      let (:address) { create(:address_directional)}
      let (:confusing_address) { create(:address_directional_confusion)}
      it 'can find the correct predirection' do
        expect(address.street_predirection).to eq('South East')
      end
      it 'can find the correct postdirection' do
        expect(address.street_postdirection).to eq('North')
      end
      it 'can ignore opposing directions' do
        expect(confusing_address.street_predirection).to eq('North')
        expect(confusing_address.street_name).to eq('South')
      end

    end

    describe '#to_s' do
      let(:address) { create(:address_ny) }
      it 'prints out the address components needed for mailing together as a string' do
        expect(address.to_s).to eq('129 W 81st St Apt 5A, New York, NY 10024')
      end
    end
  end
end
