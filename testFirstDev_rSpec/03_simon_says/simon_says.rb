def echo(phrase)
  phrase
end

def shout(phrase)
  phrase.upcase
end

def repeat(phrase, times = 2)
  #add space to phrase, repeat n times, chop last char (ie extra space)
  ((phrase << " ") * times).chop
end

def start_of_word(word, chars)
  word[0..chars-1]
end

def first_word(phrase)
  phrase.split()[0]
end

SMALLWORDS = ["the", "and", "over"]
def titleize(title)
  new_title = title.split().map do |word|
    SMALLWORDS.include?(word) ? word : word.capitalize
  end.join(" ")
new_title[0].upcase + new_title[1..-1]
end