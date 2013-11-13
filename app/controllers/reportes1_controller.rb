class Reportes1Controller < ApplicationController
  def index
	  	@user = User.find(current_user)
		@tareas = @user.tareas
  end
end
