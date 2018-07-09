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
        expect(address.get_zip_5).to eq('10024')
      end
      it 'can parse extra 4 digits' do
        expect(address.get_zip_4).to eq('2313')
      end
    end

    describe '#to_s' do
      let(:address) { create(:address_ny) }
      it 'prints out the address components needed for mailing together as a string' do
        expect(address.to_s).to eq('129 W 81st St Apt 5A, New York, NY 10024')
      end
    end

    # Do we want to add other addresses that we know are good or bad and say that those should no be valid
  end
end
