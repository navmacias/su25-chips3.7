require 'sinatra/base'

class MyApp < Sinatra::Base

  set :host_authorization, { permitted_hosts: [] }  

  get '/' do
    '<!DOCTYPE html><html><body><h1>Goodnight CS169A</h1></body></html>'
  end
end