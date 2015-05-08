require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/stylists/new') do
  erb(:stylist_form)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

post('/stylists') do
  name = params.fetch("name")
  new_stylist = Stylist.new({:name => name, :id => nil})
  new_stylist.save()
  erb(:success)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

get('/stylists/:id/clients/new') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:client_form)
end

post('/clients') do
  client_description = params.fetch("client_description")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new(:client_description => client_description, :stylist_id => stylist_id)
  @client.save()
  erb(:success)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:success)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:success)
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get("/clients/:client_description") do
  @client = Client.find(params.fetch("client_description"))
  erb(:client_edit)
end

delete("/clients/:client_description") do
  @client = Client.find(params.fetch("client_description"))
  @client.delete()
  @clients = Client.all()
  erb(:success)
end

