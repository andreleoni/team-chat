class InviteTeamMailer < ApplicationMailer
  def invite_team_email(email)
    @team = Team.first
    mail(to: email, subject: "Você recebeu um convite de email")
  end
end
