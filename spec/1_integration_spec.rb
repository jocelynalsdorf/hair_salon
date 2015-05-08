require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('path to adding, deleting,viewing clients and stylists ', {:type => :feature}) do
  it('allows user to add new stylist from the home page') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('name', :with => 'Sally')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end

  it('allows user to view  all stylists from the home page') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('name', :with => 'Sally')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
    click_link('Back')
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content('Sally')
  end

  it('allows user to click on stylist name and and view their clients') do
    test_stylist = Stylist.new({:name => 'Judy', :id => nil})
    test_stylist.save()
    test_client = Client.new({:client_description => 'MrJones', :stylist_id => test_stylist.id()})
    test_client.save()
    visit('/stylists')
    click_link(test_stylist.name())
    expect(page).to have_content(test_client.client_description)
  end

end