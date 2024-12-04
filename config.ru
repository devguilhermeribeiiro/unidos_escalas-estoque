require './app'

use Rack::Protection::HostAuthorization, allowed_hosts: [
  'localhost',
  '127.0.0.1',
  ENV['NGROK_DOMAIN']
]

run Sinatra::Application
