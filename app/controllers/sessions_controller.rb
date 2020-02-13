class SessionsController < ApplicationController

    get '/login' do 
        erb :'/sessions/new'
    end

    get '/login' do 
        user = user.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:username])
            session[:user_id] = user.id 
            redirect "/user/#{user.id}"
        else
            erb :'sessions/new'
        end
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end

end