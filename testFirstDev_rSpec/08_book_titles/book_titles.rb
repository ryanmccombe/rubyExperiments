Exceptions = ["a","an","and","in","of","the"]
class Book
  attr_accessor :title
  def title=(title)
    @title = title.split.each do |word|
      word.capitalize! unless Exceptions.include?(word)
    end.join(" ")
    @title = @title[0].upcase+@title[1..-1]
  end
end