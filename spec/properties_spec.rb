require './lib/properties.rb'


describe Properties do
  describe '#all' do
    it 'returns test db entries' do
      all_properties = Properties.all_properties
      expect(all_properties[0]["property_name"]).to eq("Bens place")
      expect(all_properties[1]["property_name"]).to eq("Volkers place")
    end
  end
end