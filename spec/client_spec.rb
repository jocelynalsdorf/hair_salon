require('spec_helper')


describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist ID out") do
      test_client = Client.new({:client_description => "bobby", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe("#client_description") do
    it("lets you give it a description") do
      test_client = Client.new({:client_description => "am", :stylist_id => 1})
      expect(test_client.client_description()).to(eq("am"))
    end
  end
  describe("#==") do
    it("is the same client if it has the same description") do
      client1 = Client.new({:client_description => "jon", :stylist_id => 1})
      client2 = Client.new({:client_description => "jon", :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end
  describe("#save") do
    it("adds a client to the database of saved clients") do
      test_client = Client.new({:client_description => "MrJ", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

end