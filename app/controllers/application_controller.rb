class ApplicationController < ActionController::Base

    # rescue_from CanCan::AccessDenied do |exception|
    #     respond_to do |format|
    #         format.html { redirect_to unauthorized_url, notice: exception.message }
    #     end
    # end

    private
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def user_role?(role_name)
        if session[:user_id]
            @permission ||= Permission.find_by_user_id(session[:user_id])
            @permission.role.name == role_name
        end
    end

    def user_role_not?(role_name)
        if session[:user_id]
            @permission ||= Permission.find_by_user_id(session[:user_id])
            @permission.role.name == role_name
        end
    end

    helper_method :current_user
    helper_method :user_role?
    helper_method :user_role_not?
end
