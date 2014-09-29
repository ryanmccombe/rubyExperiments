# Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology

require_relative "bubble_sort"
describe "the bubble_sort method" do
  it "benchmarks best case" do
    expect(bubble_sort([1,2,3,4,5,6,7,8,9,10])).to eq([1,2,3,4,5,6,7,8,9,10])
  end
  it "sorts given sample case" do
    expect(bubble_sort([4,3,78,2,0,2])).to eq([0,2,2,3,4,78])
  end
  it "sorts worst case" do
    expect(bubble_sort([10,9,8,7,6,5,4,3,2,1])).to eq([1,2,3,4,5,6,7,8,9,10])
  end
end

# Now create a similar method called #bubble_sort_by which sorts an array but accepts a block.
# The block should take two arguments which represent the two elements currently being compared.
# Expect that the block's return will be similar to the spaceship operator you learned about before.
# If the result of the block is negative, the element on the left is "smaller" than the element on the right.

describe "the bubble_sort_by method" do
  it "benchmarks best case" do
    expect(bubble_sort_by(["a","ab","abc","abcd","abcde", "abcdef"]) { |left,right|  right.length - left.length }).to eq(["a","ab","abc","abcd","abcde", "abcdef"])
  end
  it "sorts given sample case" do
    expect(bubble_sort_by(["hi","hello","hey"]) { |left,right|  right.length - left.length }).to eq(["hi", "hey", "hello"])
  end
  it "sorts worst case" do
    expect(bubble_sort_by(["abcdef","abcde","abcd","abc","ab", "a"]) { |left,right|  right.length - left.length }).to eq(["a","ab","abc","abcd","abcde", "abcdef"])
  end
end