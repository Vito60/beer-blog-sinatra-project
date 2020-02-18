class UserController < ApplicationController

    get '/user/:id' do 
        @user = User.find_by_id(params[:id])

        if @user 
            erb :'/user/show'
        else
            redirect '/'
        end
    end

    get '/signup' do 
        erb :'/user/new'
    end

    post '/signup' do 
        user = User.new(params[:user])
        if user.save
            session
            redirect "/login"
        else
            @errors = user.errors.full_messages 
            erb :'user/new'
        end
    end

end