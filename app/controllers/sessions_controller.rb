class SessionsController < ApplicationController
include SessionsHelper

skip_before_action :signed_in_user

  def create
     user = User.find_by_email(params[:session][:email].downcase)
     if user && user.authenticate(params[:session][:password])
       # Sign the user in and redirect to the user's show page.
       sign_in_user(user)
       redirect_to root_path
     else
       flash[:error] = 'Invalid email/password combination' # Not quite right!
       render 'new'
     end
   end

end
