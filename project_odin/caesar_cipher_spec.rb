# caesar_cipher Unit Test
# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string

# rSpec Note - The "should" syntax is deprecated - use expect() instead
# Old tests for reference:
# caesar_cipher("hello", 1).should == "ifmmp"
# caesar_cipher("hello", -1).should == "gdkkn"
# caesar_cipher("Hello", 1).should == "Ifmmp"
# caesar_cipher("zebra", 1).should == "afcsb"
# caesar_cipher("Catherine Zeta Jones!", 1).should == "Dbuifsjof Afub Kpoft!"


require_relative "caesar_cipher"
describe "the caeser cipher" do
  it "ciphers forwards" do
    expect(caesar_cipher("hello", 1)).to eq("ifmmp")
  end
  it "ciphers backwards" do
    expect(caesar_cipher("hello", -1)).to eq("gdkkn")
  end
  it "maintains case" do
    expect(caesar_cipher("Hello", 1)).to eq("Ifmmp")
  end
  it "wraps" do
    expect(caesar_cipher("zebra", 1)).to eq("afcsb")
  end
  it "only ciphers letters" do
    expect(caesar_cipher("Catherine Zeta Jones!", 1)).to eq("Dbuifsjof Afub Kpoft!")
  end
end