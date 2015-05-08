class Client
attr_reader(:client_description, :stylist_id)

  define_method(:initialize) do |attributes|
    @client_description = attributes.fetch(:client_description)
    @stylist_id = attributes.fetch(:stylist_id)
    
    
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_description = client.fetch("client_description")
      stylist_id = client.fetch("stylist_id").to_i() 
      clients.push(Client.new({:client_description => client_description, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.client_description().==(another_client.client_description()).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (client_description, stylist_id) VALUES ('#{@client_description}', #{@stylist_id});")
    
  end
  
end