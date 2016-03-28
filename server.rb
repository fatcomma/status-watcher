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
# Add your trusted users here
WHITELIST = ["foo", "bar"]

# Check incoming status update 
def check_status(payload)
  # get login of user who set status
  sender = payload.sender.login
  commit = payload.commit.sha

  # determine if user who set status is in whitelist
  if WHITELIST.include? sender
    puts "Status set by trusted user \\o/"
  else
    puts "WARNING! Status set by untrusted user #{sender}"
    puts "Status changed for commit #{commit}"
  end
end

# Respond to webhook status events
post '/payload' do
  payload = JSON.parse(request.body.read, object_class: OpenStruct)

  # inspect payload for anything suspicious :)
  check_status(payload)
end
