class SessionsController < ApplicationController
    def new
        if session[:user_id]
            redirect_to "/professional_profile"
        else
            redirect_to root_path
        end
    end

    def create
        user = User.find_by_email(params[:user][:email])
        if user
          if user.try(:authenticate, params[:user][:password])
              session[:user_id] = user.id

              return redirect_to "/professional_profile"
          end
            flash[:errors] = ['Password is incorrect']
        else
            flash[:errors] = ['Invalid account. Register first.']
        end
        return redirect_to :back
    end

    def destroy
        session.delete(:user_id) if session[:user_id]
        return redirect_to new_login_path
    end
end
