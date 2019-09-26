require './server.rb'

feature 'viewing root' do
  scenario 'viewing root' do
    visit '/'
    expect(page).to have_content('Hello world')
  end
end

feature 'viewing all listings in front-end' do
  scenario 'it shows the test properties' do
    filename = "#{ENV['HTML_PATH']}/views/index.html"
    Capybara.app = Rack::File.new(ENV['HTML_PATH'])
    visit 'views/index.html'
    # expect(page).to have_content('Bens place')
    # expect(page).to have_content('Dans place')
    # expect(page).to have_content('Volkers place')
    Capybara.app = Server
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
  scenario 'booking a property on a given date renders to property unavailable' do
    Capybara.app = Server
    all_properties = Properties.all_properties
    first_property_id = all_properties.first['id']
    first_property_date = Properties.get_availability(id: first_property_id).first['date']
    visit "/book/#{first_property_id}/#{first_property_date}"

    p first_property_id
    p Properties.get_availability(id: first_property_id).first
    expect(Properties.get_availability(id: first_property_id).first['availability']).to eq('f')
    expect(page).to have_content('Confirmed')
  end
end
