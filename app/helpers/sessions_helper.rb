module SessionsHelper

    def log_in(usuario)
        session[:usuario_id] = usuario[:username]
    end
  
    def current_user
        @current_user ||= Usuario.find_by(username: session[:usuario_id])
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def log_out
        session.delete(:usuario_id)
        @current_user = nil
    end
end
