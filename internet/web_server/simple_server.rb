require 'socket'
require 'json'
require 'erb'

server = TCPServer.open(2000)
puts 'Server Running'

def request_breakdown(request)
  request.strip.split
end

def respond(client, protocol, status='200 OK', file = nil)
  client.puts "#{protocol} #{status}"
  client.puts "Date: #{Time.now.ctime}"
  client.puts 'Connection: close'
  client.puts 'Server: Simple Ruby Server'
  client.puts 'Accept-Ranges: bytes'
  if file
    client.puts 'Content-Type: text/html'
    client.puts "Content-Length: #{file.size}"
    client.puts "Last-Modified: #{file.mtime}"
    client.puts "\r\n\r\n"
    client.puts file.read
  end
end

loop {
  Thread.start(server.accept) do |client|
    request = request_breakdown(client.read_nonblock(256))
    puts method = request[0]
    puts file = request[1][1..-1] #strip leading /
    puts protocol = request[2]
    puts body = request[-1]

    if File.exist?(file)
      f = File.open(file)
      if method == 'GET'
        respond(client, protocol, '200 OK', f)
      end
      if method == 'POST'
        params = JSON.parse(body)

        html = '<ul>'
        html << " <li>Name: #{params['name']['name']}</li>"
        html << " <li>E-Mail: #{params['name']['email']}</li>"
        html << '</ul>'

        f = File.open('thanks.html')
        package = f.read.sub('<%= yield %>', html)

        respond(client, protocol, '200 OK')
        client.puts "Content-Length: #{package.size}"
        client.puts "\r\n\r\n"
        client.puts package
      end
    else
      respond(client, protocol, '404 NOT FOUND')
    end
    client.close
  end
}
