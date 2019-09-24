require './server.rb'

feature 'viewing root' do
  scenario 'viewing root' do
    visit '/'
    expect(page).to have_content('Hello world')
  end
end

feature 'booking a property' do
  scenario 'booking a property renders to property unavailable' do
    all_properties = Properties.all_properties
    first_property_id = all_properties.first['id']
    visit "/book/#{first_property_id}"
    expect(Properties.get_property(id: first_property_id)['availability']).to eq('f')
    expect(page).to have_content('Confirmed')
  end
end
