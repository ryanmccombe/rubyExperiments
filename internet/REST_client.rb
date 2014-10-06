require 'rest-client'

print 'Google Search: '
search = gets.chomp

url = "http://www.google.com/#q=#{search}".gsub(' ', '+')
puts url

puts (response = RestClient.get(url)).headers
puts response