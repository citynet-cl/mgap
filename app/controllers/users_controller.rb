class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize#, only: [:edit,:update]
  load_and_authorize_resource

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
	  if params[:user][:password].blank? 
		  params[:user].delete(:password)
		  params[:user].delete(:password_confirmation)
	  end
	  params[:user][:role_ids] ||= []
	  	if current_user.has_role? :admin
			if @user.update(user_params)
				redirect_to users_url, notice: "usuario editado exitosamente"
			else
				render action: 'edit'
			end
		else
			if @user.update(user_params)
				redirect_to edit_user_path(current_user), notice: "usuario editado exitosamente"
			else
				render action: 'edit'
			end
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
		params.require(:user).permit(:usuario, :nombre, :apellido, :email, :password, :password_confirmation, :role_ids => [])
	end
end
