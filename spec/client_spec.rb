require('spec_helper')


describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#client_description") do
    it("lets you give it a description") do
      test_client = Client.new({:client_description => "am", :stylist_id => 1})
      expect(test_client.client_description()).to(eq("am"))
    end
  end
end