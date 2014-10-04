require 'net/http'

# GET
def get_web_document(url)
  url = URI.parse(url)
  response = Net::HTTP.get_response(url)

  # case response
  #   when Net::HTTPSuccess
  #     return response
  #   when Net::HTTPRedirection
  #     return get_web_document(response['Location'])
  #   else
  #     return nil
  # end
end

puts get_web_document('http://www.rubyinside.com/test.txt').inspect
puts get_web_document('http://www.rubyinside.com/non-existent').inspect
puts response = get_web_document('http://www.rubyinside.com/redirect-test')

puts response.inspect
puts response.class
puts response.methods.sort.join(', ')
puts response.message
puts response.header
puts response.body
puts response.inspect
puts response['location']

# POST
url = URI.parse('http://www.rubyinside.com/test.cgi')
response = Net::HTTP.post_form(url,{'name' => 'David', 'age' => '24'})
puts response.body

# open-uri
require 'open-uri'

f = open('http://www.rubyinside.com/test.txt')

puts f
puts f.class
puts f.methods.sort.join(', ')
puts f.read
puts f.content_type
puts f.charset
puts f.last_modified