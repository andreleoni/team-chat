class NotifyChannel < ApplicationCable::Channel
  delegate  :ability, to: :connection
  protected :ability

  def subscribed
    if authorize_notify
      stream_from "notify_messages"
    end
  end

  def receive(data)
    # @message = Message.new(body: data["message"], user: current_user)
    @notify = Notify.new(status: :pendent, params[:id])
    @record.notifies << @message
  end

  private

  def authorize_notify
    if params[:type] == "channels"
      @record = Channel.find(params[:id])
    elsif params[:type] == "talks"
      @record = Talk.find_by(user_one_id: [params[:id], current_user.id], user_two_id: [params[:id], current_user.id], team: params[:team_id])
    end

    @chat = @record.id
    (ability.can? :read, @record)? true : false
  end
end