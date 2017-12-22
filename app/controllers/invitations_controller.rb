class InvitationsController < ApplicationController
before_action :require_login
# before_action :require_correct_user, only: [:show]

    def show
        @user = User.find(session[:user_id])
        @user_invitees = Invitation.where(user: User.find(session[:user_id])).where(invited: true)
        @user_invitors = Invitation.where(invitee: User.find(current_user)).where(invited: true)
        @invitors = Invitation.where(invited: User.find(current_user)).where(invited: false)
    end

    def create
        Invitation.create(invitor: User.find(current_user), invitee: User.find(params[:invited]))
          redirect_to professional_profile_path
    end
    def update
        Invitation.find_by(invitor: User.find(params[:id]), invitee: User.find(current_user)).update(accepted: true)
        redirect_to :back
    end
    def destroy
        Invitation.find_by(invitor: User.find(params[:invitor]), invitee: User.find(current_user)).delete
        redirect_to :back
    end
end
