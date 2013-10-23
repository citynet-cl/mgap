class SessionsController < ApplicationController
  def new
  end

  def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
		  redirect_to root_url, notice: "logeado!"
	  else
		  flash.now.alert = "datos invalidos"
		  render "new"	  	
	  end
	  
  	
  end
  def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: "deslogeao!"
  	
  end
	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
