class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @invitation = current_user.invitations.new(invitation_params)
    if @invitation.save
      # Send invitation email (implement this later)
      redirect_to root_path, notice: "Invitation sent successfully."
    else
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :timetable_id)
  end
end
