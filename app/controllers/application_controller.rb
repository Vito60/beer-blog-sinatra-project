require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  def current_user
    User.find_by_id(session[:user_id]) if is_logged_in?
  end

  def is_logged_in?
    !!session[:user_id]
  end

  def reditect_if_not_logged_in 
    redirect '/' if !is_logged_in?
  end

end
