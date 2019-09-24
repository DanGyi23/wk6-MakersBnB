require './server.rb'

feature 'viewing root' do
  scenario 'viewing root' do
    visit '/'
    expect(page).to have_content('Hello world')
  end
end

feature 'viewing all listings in front-end' do
  scenario 'it shows the test properties' do
    filename = "#{ENV['HTML_PATH']}/views/listing.html"
    visit filename
    # expect(page).to have_content('Bens place')
    # expect(page).to have_content('Dans place')
    # expect(page).to have_content('Volkers place')
  end
end

feature 'viewing all listings in front-end' do
  scenario 'it shows the details of selected properties' do
    filename = "#{ENV['HTML_PATH']}/views/listing.html"
    visit filename
    # click_on(tbd)
    # expect(page).to have_content('Bens place')
    # expect(page).to have_content('Bens fantastic place')
  end
end

feature 'booking a property via URL call' do
  scenario 'booking a property renders to property unavailable' do
    all_properties = Properties.all_properties
    first_property_id = all_properties.first['id']
    visit "/book/#{first_property_id}"
    expect(Properties.get_property(id: first_property_id)['availability']).to eq('f')
    expect(page).to have_content('Confirmed')
  end
end
