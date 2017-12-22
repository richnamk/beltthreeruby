class UsersController < ApplicationController
    before_action :require_login, except: [:main, :create]
    # before_action :require_correct_user, only: [:edit, :update, :destroy]

    def index
        @users = User.all.where.not(id: User.find(current_user))
        # .invitees.where.not(id: User.find(current_user).invitors).where.not(id: User.find(current_user))
    end

    def main
        if session[:user_id]
          redirect_to "/professional_profile"
        end
    end

    def create
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id
            # puts 'error'
            return redirect_to "/professional_profile"
        end
        flash[:errors] = user.errors.full_messages
        # puts 'contin'
        return redirect_to :back
    end

    def show
        @user = User.find(params[:id])
    end

    private
        def user_params
            params.require(:user).permit(:name, :description, :email, :password, :password_confirmation)
        end
end
