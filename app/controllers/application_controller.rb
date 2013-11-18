class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_filter do
	  resource = controller_path.singularize.gsub('/', '_').to_sym
	  method = "#{resource}_params"
	  params[resource] &&= send(method) if respond_to?(method, true)
  end
  rescue_from CanCan::AccessDenied do |exception|
	  flash[:alert] = exception.message
	  redirect_to root_url
  end

  def authorize
  	redirect_to root_url, alert: "logeate primero" if current_user.nil?
  end

  private

  def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]  	
  end

  helper_method :current_user

    def ordenar_direccion
	   # params[:sort] || "fecha_registro"
	%w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def ordenar_columna
	    #params[:direction] || "desc"
	Tarea.column_names.include?(params[:sort]) ? params[:sort] : "fecha_registro"
    end

  helper_method :ordenar_columna, :ordenar_direccion

end
