require './lib/properties.rb'


describe Properties do
  describe '#all' do
    it 'returns test db entries' do
      properties = Properties.all
      expect(properties[0]["property_name"]).to eq("Bens place")
      expect(properties[1]["property_name"]).to eq("Volkers place")
    end
  end
end