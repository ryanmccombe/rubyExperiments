VOWELS = ["A", "E", "I", "O", "U"]

# in what scenarios is a vowel counted as a consonant - only handles 2 letter inputs for now
EXCEPTIONS = ["QU"]

def translate(phrase)
    phrase.split.map do |word|
      consonants = 0
      word.length.times do |i|
        VOWELS.include?(word[i].upcase) && !(EXCEPTIONS.include?(word[i-1..i].upcase))? break : consonants+=1
      end
      consonants > 0 ? word[consonants..-1]+word[0..consonants-1] + "ay" : word + "ay"
    end.join(" ")
end

# alternative by recursion
def translate2(phrase)
  if phrase.match(" ")
    phrase.split.map do |word|
      translate(word)
    end.join(" ")
  else
    consonants = 0
    phrase.length.times do |i|
      VOWELS.include?(phrase[i].upcase) && !(EXCEPTIONS.include?(phrase[i-1..i].upcase)) ? break : consonants+=1
    end
    consonants > 0 ? phrase[consonants..-1]+phrase[0..consonants-1] + "ay" : phrase + "ay"
  end
end