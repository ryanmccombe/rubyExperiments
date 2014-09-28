# Iterates over dictionary

def substrings(string, dictionary)
  string.downcase!
  hits = {}
  dictionary.each do |word|
    hits[word] = string.scan(word).size if string.scan(word).size > 0
  end
  hits
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary) # {"below"=>1, "low"=>1}
puts substrings("Howdy partner, sit down! How's it going?", dictionary) # {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
