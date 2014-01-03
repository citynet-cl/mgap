class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  load_and_authorize_resource

	def index
		@users = User.order(:usuario)
	end
	
	def edit		
	end

	def new
		@user = User.new		
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_url, notice: "Usuario creado exitosamente"
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
				redirect_to users_url, notice: "Usuario editado exitosamente"
			else
				render action: 'edit'
			end
		else
			if @user.update(user_params)
				redirect_to edit_user_path(current_user), notice: "Usuario editado exitosamente"
			else
				render action: 'edit'
			end
		end
	end


	def destroy
		@user.destroy
		redirect_to users_url, notice: "Usuario anulado"
	end

	def estado
		@user = User.find(params[:id])
		if @user.activo? and @user != current_user
			@user.update_attributes(activo: false)
			redirect_to users_url
		elsif @user.activo? and @user == current_user
			redirect_to users_url, notice: "No se puede deshabilitar el usuario actual"
		else
			@user.update_attributes(activo: true)
			redirect_to users_url
		end
	end
	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:usuario, :nombre, :apellido, :email, :password, :password_confirmation, :activo, :role_ids => [])
	end
end
