require './server.rb'
require './spec/spec_helper.rb'

feature 'viewing root' do
  scenario 'viewing root' do
    visit '/'
    expect(page).to have_content('Hello world')
  end
end
