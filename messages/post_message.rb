# post_message.rb
require 'uri'
require 'net/http'

puts ""
print "Who do you want to message? "
to = gets.chomp

print "Who are you? "
from = gets.chomp

print "Your message: "
content = gets.chomp

puts ""
print "Sending message..."

uri = URI("http://localhost:9292")

#Net::HTTP.get_print(uri)
# http = Net::HTTP.new(uri.host, uri.port)
#response = http.request(Net::HTTP::Get.new(uri.request_uri))
# TODO: Post the message to the server



# response = Net::HTTP::Post.new(uri.request_uri)
# response.set_form_data({"to" => "body", "from" => "50"})
# response = Net::HTTP.post_form(uri, {"q" => "My query", "per_page" => "50"})

#request = http.response(response)
#response = http.request(request)

http = Net::HTTP.new(uri.host, uri.port)  #setting up the connection
request = Net::HTTP::Post.new(uri.request_uri) #setting up the request
request.set_form_data({"to" => to, "from" => from, "content" => content})  #setup data txfr
response = http.request(request) #this actually makes the connection to server/Sinatra

if response.body == "success" 
  puts "done!"
else
  puts "Oops, something went wrong :("
end

puts ""
