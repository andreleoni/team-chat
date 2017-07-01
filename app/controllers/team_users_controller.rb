class TeamUsersController < ApplicationController
  before_action :set_team_user, only: [:destroy, :disable]

  def create
    @team_user = TeamUser.new(team_user_params)
    @team_user.status = :active
    authorize! :create, @team_user
    
    respond_to do |format|
      if @team_user.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @team_user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def disable
    if @team_user.present?
      authorize! :disable, @team_user
      @team_user.update_attribute(:status, :disable) 
      
    elsif @team.present?
      authorize! :destroy, Team
      @team.destroy
    end

    respond_to do |format|
      format.json { render json: true }
    end
  end

  private

  def set_team_user
    @team_user = TeamUser.find_by(user_id: current_user.id, team_id: params[:team_user_id].to_i)

    if @team_user.blank?
      @team = Team.find_by(user_id: current_user.id, id: params[:team_user_id].to_i)
    end
  end

  def team_user_params
    user = User.find_by(email: params[:team_user][:email])
    params.require(:team_user).permit(:team_id).merge(user_id: user.id)
  end
end
