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
      expect(property[0]["property_name"]).to eq("Bens place")

    end
  end

end