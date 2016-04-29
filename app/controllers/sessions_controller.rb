class SessionsController < ApplicationController
   
   def new
   end
   
   def create
       #render 'new'
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
           session[:user_id] = user.id
           flash[:success] = "You have successfully logged in"
           redirect_to user_path(user)
       else
           flash.now[:danger] = "There was somehitng wrong with you login information"
          render 'new' 
       end
   end
   
   def destroy
    session[:user_id] = nil
    flash[:success] = "Log out"
    redirect_to root_path
   end
    
end