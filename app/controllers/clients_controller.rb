class ClientsController < ApplicationController
  get '/clients' do
    clients = Client.all
    clients.to_json
  end
end