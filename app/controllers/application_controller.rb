class ApplicationController < ActionController::Base
    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_role?(role)
        @permission ||= Permission.find_by_user(current_user)
        @permission.role == role
    end

    helper_method :current_user

    def authorize
        redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end
end
