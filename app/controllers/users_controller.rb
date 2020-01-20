class UsersController < ApplicationController
    def new
        @user = User.new
        @default_role = Role.where("name LIKE ?", "Użytkownik").first
        @roles_array = Role.all.map { |role| [role.name, role]}
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Thank you for signing up!"
        else
            render "new"
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :first_name, :last_name, :password, :password_confirmation, :role)
    end
end
