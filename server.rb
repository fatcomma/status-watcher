require 'net/http'
require 'sinatra'
require 'json'
require 'uri'

CONTEXT = "status watcher"
GITHUB_TOKEN = ENV['GITHUB_TOKEN']
GITHUB_ROOT = "https://api.github.com"
HEADERS = {
  'Content-Type' => 'text/json',
  'Authorization' => "token #{GITHUB_TOKEN}"
}
WHITELIST = ["hubot", "foo"]

# Check incoming status update 
def check_status(payload)
  sender = payload.sender.login

  if WHITELIST.include? sender
    puts "Status set by trusted user \o/"
  else
    puts "WARNING! Status set by untrusted user #{sender}"
  end
end

# Respond to webhook events
post '/payload' do
  payload = JSON.parse(request.body.read, object_class: OpenStruct)

  # update status to pending until completed
  check_status(payload)
end
