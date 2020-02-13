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
         redirect_if_not_logged_in

         erb :'blog/new'
    end

    post '/blog' do 

        redirect '/blog'
    end

    get '/blog/:id' do 
        redirect_if_not_logged_in
        find_blog(params[:id])

        erb :'blog.show'
    end

    get '/blog/:id/edit' do 
        redirect_if_not_logged_in
        find_blog(params[:id])

        erb :'blog/edit'
    end

    patch '/blog/:id' do 
        redirect_if_not_logged_in
        find_blog(params[:id])

        if @blog.update(params[:blog])
            redirect "/blog/#{@blog.id}"
        else
            erb :'blog/edit'
        end
    end

    delete '/blog/:id' do 
        redirect_if_not_logged_in
        find_blog(params[:id])

        redirect '/blog'
    end

    def find_blog(id)
        @blog = Blog.find_by_id(params[:id])
    end
    
end