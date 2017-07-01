class InviteTeamMailer < ApplicationMailer
  def invite_team_email(team_id, email)
    @team = Team.find(team_id)    
    mail(to: email, subject: "Você recebeu um convite de email")
  end
end
