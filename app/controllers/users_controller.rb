class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize#, only: [:edit,:update]

	def index
		@users = User.all
	end
	
	def edit		
	end

	def new
		@user = User.new		
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#session[:user_id] = @user.id 
			redirect_to users_url, notice: "usuario creado exitosamente"
		else
			render "new"
		end		
	end


  	def update
	  if params[:user][:password].blank? or params[:user][:password_confirmation].blank?  
		  params[:user].delete(:password)
		  params[:user].delete(:password_confirmation)
	  end
		if @user.update(user_params)
			redirect_to users_url, notice: "usuario editado exitosamente"
		else
			render action: 'edit'
		end
	end


	def destroy
		@user.destroy
		redirect_to users_url, notice: "usuario borrado"
	end

	private

	def set_user
		@user = User.find(params[:id])
	end


	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :admin )
	end
end
