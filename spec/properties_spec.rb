require './lib/properties.rb'

describe Properties do
  describe '#all' do
    it 'returns test db entries' do
      all_properties = Properties.all_properties
      expect(all_properties[0]['property_name']).to eq('Bens place')
      expect(all_properties[1]['property_name']).to eq('Volkers place')
    end
  end
  describe '#get_property' do
    it 'returns test db entries of particular propterty when given id' do
      all_properties = Properties.all_properties
      first_property_id = all_properties.first['id']
      property = Properties.get_property(id: first_property_id)
      expect(property['property_name']).to eq('Bens place')
    end
  end
  describe '#book_property' do
    it 'booked property becomes unavailable ' do
      all_properties = Properties.all_properties
      first_property_id = all_properties.first['id']
      expect(all_properties.first['availability']).to eq('t')
      Properties.book_property(id: first_property_id)
      first_property = Properties.get_property(id: first_property_id)
      expect(first_property['availability']).to eq('f')
    end
  end
  describe '#book_property' do
    it 'booked a property returns hash with confirmation message' do
      all_properties = Properties.all_properties
      first_property_id = all_properties.first['id']
      booking_result = Properties.book_property(id: first_property_id)
      expect(booking_result['message']).to eq('Confirmed')
      expect(booking_result['id']).to eq(first_property_id)
    end
  end

  describe '#addnew' do
    it 'adds a new property to the database' do
      Properties.addnew(property_name: "Bens New Place", price: "100", property_type: "Apartment", property_description: "Really nice. Lots of character.", capacity: "100", location: "London", size: "200", bathrooms: "2", beds: "5", wifi: "TRUE", washing_machine: "TRUE")
      all_properties = Properties.all_properties
      expect(all_properties.last['property_name']).to eq('Bens New Place')
    end
  end
end
