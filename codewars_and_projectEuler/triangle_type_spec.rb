require_relative "triangle_type"
describe "triangle_type" do
  it "works" do
    expect(triangle_type(7,3,2)).to eq(0)  # Not triangle
    expect(triangle_type(2,4,6)).to eq(0)  # Not triangle
    expect(triangle_type(8,5,7)).to eq(1)  # Acute
    expect(triangle_type(3,4,5)).to eq(2)  # Right
    expect(triangle_type(7,12,8)).to eq(3) # Obtuse
  end
end


