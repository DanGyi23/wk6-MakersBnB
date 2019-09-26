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
  
  describe '#change_availability' do
    it 'booked property becomes unavailable on given date' do
      all_properties = Properties.all_properties
      first_property_id = all_properties.first['id']
      first_property_date = Properties.get_availability(id: first_property_id).first['date']
      Properties.change_availability(id: first_property_id, date: first_property_date)
      available_properties = Properties.get_availability(id: first_property_id)
      expect(available_properties).not_to include(first_property_date)
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
