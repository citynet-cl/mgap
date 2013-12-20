class ApplicationController < ActionController::Base
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
  	redirect_to root_url, alert: "Es necesario iniciar sesión." if current_user.nil?
  end

  private

  def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]  	
  end

  helper_method :current_user

  def mobile_device?
	  request.user_agent =~ /Mobile/  	
  end
  helper_method :mobile_device?
end
