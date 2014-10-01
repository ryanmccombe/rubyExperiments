stopwords = %w{the a by on for of are with just but and to the my in I has some}
lines = File.readlines(ARGV[0]) unless ARGV[0].nil?
# lines ||= File.readlines("newsreport.txt")
lines ||= File.readlines("oliver_twist.txt")
line_count = lines.size
text = lines.join
total_characters = text.length
total_characters_nospace = text.gsub(/\s+/, '').length
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

## Keyword Extension ##
keywords = text.split.select { |word| !stopwords.include?(word) }
keyword_percent = ((keywords.length.to_f / word_count.to_f) * 100).to_i

## Summary Extension ##
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length/3
ideal_sentences = sentences_sorted.slice(one_third, one_third+1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
# Cleanse post-deliminator chars, like "this."
ideal_sentences = ideal_sentences.map { |sentence| sentence.gsub(/^\W* /, "").strip}

## Output ##
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospace} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count/paragraph_count} sentences per paragraph"
puts "#{word_count/sentence_count} words per sentence"
puts "#{keyword_percent}% keywords"
puts ideal_sentences.join(".\n")