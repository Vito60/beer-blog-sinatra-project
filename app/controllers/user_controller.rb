class UserController < ApplicationController

    get '/user/:id' do 
        if current_user != nil && @user = User.find_by_id(params[:id])
            if @user.id == current_user.id
                erb :'/user/show'
            else 
                redirect "/user/#{current_user.id}"
            end
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