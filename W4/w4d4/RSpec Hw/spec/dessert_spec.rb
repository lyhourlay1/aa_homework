require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef",name:"Lyhour") }
  subject(:cookies) {Dessert.new('chocolate', 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookies.type).to eq("chocolate")
    end
    it "sets a quantity" do
      expect(cookies.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(cookies.ingredients).to be_empty 
    end
    it "raises an argument error when given a non-integer quantity" do 
      expect{Dessert.new("brownie", "adfa","ton")}.to raise_error("need to be integer")
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(cookies.add_ingredient("Sugar")).to include('Sugar')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cookies.add_ingredient("Sugar")
      cookies.add_ingredient("water")
      expect(cookies.mix!).to include('Sugar')
      expect(cookies.mix!).to include('water')
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      expect(cookies.eat(10)).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect{cookies.eat(51)}.to raise_error("not enough left")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Lyhour the Great Baker")
      expect(cookies.serve).to eq("Chef Lyhour the Great Baker has made 50 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookies)
      cookies.make_more
    end
  end
end
