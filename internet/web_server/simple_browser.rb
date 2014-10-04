require 'socket'
require 'json'

host = 'localhost'     # The web server
port = 2000                           # Default HTTP port
path = '/index.html'                 # The file we want

print 'GET or POST: '
method = gets.chomp.upcase
users = Hash.new
if method == 'POST'
  user = Hash.new # Hash within hash for Rails parity
  print 'Give Name: '
  user[:name] = gets
  print 'Give E-Mail: '
  user[:email] = gets
  users[:name] = user
end

request = "#{method} #{path} HTTP/1.0"
request << "\r\nContent-Length: #{users.size}"
request << "\r\n\r\n #{users.to_json}"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2)
print headers
puts
print body                          # And display it