class SessionsController < ApplicationController

    get '/login' do 
        erb :'/sessions/new'
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end

end