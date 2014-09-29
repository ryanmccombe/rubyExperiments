# Add your new methods onto the existing Enumerable module.

require_relative "enumerable_methods"

# Create #my_each, a method that is identical to #each but (obviously) does not use #each.
describe "my_each" do
  it "works with block" do
    expect([1,2,3,4,5].my_each{ |n| n*2 }.to eq([2,4,6,8,10]))
  end
end

# Create #my_each_with_index in the same way.
describe "my_each_with_index" do
  it "works with block" do
    expect([1,1,1,1,1].my_each_with_index{|n,i| n + i}.to eq([1,2,3,4,5]))
  end
end

# Create #my_select in the same way, though you may use #my_each in your definition (but not #each).
describe "my_select" do
  it "works with block" do
    expect([1,2,3,4,5].my_select{|n| n%2!=0}.to eq([1,3,5]))
  end
end

# Create #my_all? (continue as above)
describe "my_all?" do
  it "works with block" do
    expect([1,2,3,4,5].my_all?{ |n| n%2!=0 }.to eq(false))
    expect([1,2,3,4,5].my_all?{ |n| n.is_a? Integer }.to eq(true))
  end
  it "works without block" do
    expect([nil, true, 99].all?.to eq(false))
    expect(["bacon", "toaster"].all?.to eq(true))
  end
end

# Create #my_any?
describe "my_any?" do
  it "works with block" do
    expect([1,2,3,4,5].my_any?{ |n| n%2!=0 }.to eq(true))
    expect([1,2,3,4,5].my_any?{ |n| n.is_a? String }.to eq(false))
  end
  it "works without block" do
    expect([nil, true, 99].any?.to eq(true))
    expect(nil.any?.to eq(false))
  end
end

# Create #my_none?
describe "my_none?" do
  it "works with block" do
    expect([1,2,3,4,5].my_none?{ |n| n%2!=0 }.to eq(false))
    expect([1,2,3,4,5].my_none?{ |n| n.is_a? String }.to eq(true))
  end
  it "works without block" do
    expect([].none?.to eq(true))
    expect([nil].none?.to eq(true))
    expect([nil, false].none?.to eq(true))
    expect([nil, "toaster"].none?.to eq(false))
  end
end

# Create #my_count
describe "my_count" do
  it "works by default" do
    expect([1,2,3,4,5].my_count.to eq(5))
  end
  it "works with arg" do
    expect([1,2,3,4,5].my_count(2).to eq(1))
    expect([1,2,3,4,5].my_count(10).to eq(0))
  end
  it "works with block" do
    expect([1,2,3,4,5].my_count{|n| n%2!=0 }.to eq(3))
  end
end

# Create #my_map
describe "my_map" do
  it "works with block" do
    expect([1,2,3,4,5].my_map{|n| n*2}.to eq([2,4,6,8,10]))
    expect([1,2,3,4,5].my_map{ "bacon" }.to eq(["bacon", "bacon", "bacon", "bacon", "bacon"]))
  end
end

# Create #my_inject
describe "my_inject" do
  it "works with block" do
    expect([1,2,3,4,5].my_inject{|sum,n| sum + n}.to eq(15))
  end
  it "works with block + arg" do
    expect([1,2,3,4,5].my_inject(1){|product,n| product * n}.to eq(151200))
  end
end