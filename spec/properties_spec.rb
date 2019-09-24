require './lib/properties.rb'


describe Properties do
  describe '#all' do
    it 'returns test db entries' do
      all_properties = Properties.all_properties
      expect(all_properties[0]["property_name"]).to eq("Bens place")
      expect(all_properties[1]["property_name"]).to eq("Volkers place")
    end
  end

  describe '#get_property' do
    it 'returns test db entries of particular propterty when given id' do
      all_properties = Properties.all_properties
      first_property_id = all_properties.first["id"]
      property = Properties.get_property(id: first_property_id)
      expect(property["property_name"]).to eq("Bens place")
    end
  end

  describe '#book_property' do
    it 'booked property becomes unavailable ' do
      all_properties = Properties.all_properties
      first_property_id = all_properties.first["id"]
      expect(all_properties.first["availability"]).to eq('t')
      Properties.book_property(id: first_property_id)
      all_properties = Properties.all_properties
      first_property = Properties.get_property(id: first_property_id)
      expect(first_property[0]["availability"]).to eq('f')
    end
  end
end
