require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("starts off with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

describe("#name") do
    it("tells you its name") do
      stylist = Stylist.new({:name => "Joan", :id => nil})
      expect(stylist.name()).to(eq("Joan"))
    end
  end

describe("#id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:name => "Jeff", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:name => "Evan", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end
describe("#==") do
    it("is the same stylist if it has the same name") do
      stylist1 = Stylist.new({:name => "Jeff", :id => nil})
      stylist2 = Stylist.new({:name => "Jeff", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end
describe(".find") do
    it("returns a stylist item by its id") do
      test_stylist = Stylist.new({:name => "Moose", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Mouse", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end
describe("#clients") do
    it("returns an array of clients associated with a particular stylist_id") do
      test_stylist = Stylist.new({:name => "Greg", :id => nil})
      test_stylist.save()
      test_client = Client.new({:client_description => "am", :stylist_id => test_stylist.id(), :id => nil})
      test_client.save()
      expect(test_stylist.clients()).to(eq([test_client]))
    end
  end  

describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "evy", :id => nil})
      stylist.save()
      stylist.update({:name => "paul"})
      expect(stylist.name()).to(eq("paul"))
    end
  end


describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "jill", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "joan", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
     it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "jen", :id => nil})
      stylist.save()
      client = Client.new({:client_description => "missy", :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:client_description => "Ray", :stylist_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end

  end

end