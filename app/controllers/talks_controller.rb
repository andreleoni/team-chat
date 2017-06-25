class TalksController < ApplicationController
  before_action :set_talk, only: [:show]

  def show
    # TODO: check this permission
    # authorize! :read, @talk
    # raise @talk.inspect
  end

  private

  def set_talk
    @talk = Talk.find_by(user_one_id: [params[:id], current_user.id], user_two_id: [params[:id], current_user.id], team: params[:team_id])

    if @talk.blank?
      @talk = Talk.create(user_one_id: current_user.id, user_two_id: params[:id].to_i, team: Team.find(1))
    end
  end
end
