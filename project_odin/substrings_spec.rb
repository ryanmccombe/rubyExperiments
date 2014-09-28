# substrings Unit Test
# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary)
# as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string
# and how many times it was found.

require_relative "substrings"
describe "the substrings method" do
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  it "works with a word" do
    expect(substrings("below", dictionary)).to eq({"below"=>1, "low"=>1})
  end
  it "works with multiple words" do
    expect(substrings("Howdy partner, sit down! How's it going?", dictionary)).to eq({"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1})
  end
end