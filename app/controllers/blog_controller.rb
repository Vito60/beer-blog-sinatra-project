class BlogController < ApplicationController

    get '/blog' do 
        if is_logged_in?
            @blog = current_user.blog
            erb :'blog/index'
        else
            redirect '/login'
        end
    end

    get '/blog/new' do 
        if is_logged_in?
            erb :'blog/new'
        else  
            redirect '/login'
        end    
    end

    post '/blog' do 
        blog = current_user.blog.build(params[:blog])
        if blog.save
        redirect '/blog'
        else
            erb :'list/new'
        end
    end

    get '/blog/:id' do 
        redirect_if_not_logged_in
        @blog = find_blog(params[:id])

        erb :'blog/show'
    end

    get '/blog/:id/edit' do 
        redirect_if_not_logged_in
        find_blog(params[:id])
        authorize_user_to_blog(@blog)

        erb :'blog/edit'
    end

    patch '/blog/:id' do 
        redirect_if_not_logged_in
        find_blog(params[:id])
        authorize_user_to_blog(@blog)

        if @blog.update(params[:blog])
            redirect "/blog/#{@blog.id}"
        else
            erb :'blog/edit'
        end
    end

    delete '/blog/:id' do 
        redirect_if_not_logged_in
        @blog = find_blog(params[:id])
        authorize_user_to_blog(@blog)
        @blog.destroy
        redirect '/blog'
    end

    def find_blog(id)
        @blog = Blog.find_by_id(params[:id])
    end

    def authorize_user_to_blog(blog)
        redirect '/' unless blog.user_id == current_user.id
    end
    
end