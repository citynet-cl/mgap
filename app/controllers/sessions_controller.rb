class SessionsController < ApplicationController
  def new
  end

  def create
	  user = User.find_by_usuario(params[:sessions][:usuario].downcase)
	  if user && user.authenticate(params[:sessions][:password]) && user.activo?
		  session[:user_id] = user.id
		  unless current_user.has_role? :admin
			  redirect_to tareas_url, notice: "Bienvenido."
		  else
			  redirect_to proyectos_url, notice: "Bienvenido."
		  end
	  else
		  unless user.activo?
			  flash.now.alert = "Usuario deshabilitado"
			  render "new"
		  else
			  flash.now.alert = "Datos inválidos."
			  render "new"
		  end
	  end
	  
  	
  end
  def destroy
	  session[:user_id] = nil
	  redirect_to login_path, notice: "Hasta pronto!."
  	
  end
	private

	def user_params
		params.require(:user).permit(:usuario, :password)
	end
end
