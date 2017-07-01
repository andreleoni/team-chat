# Preview all emails at http://localhost:3000/rails/mailers/invite_team_mailer
class InviteTeamMailerPreview < ActionMailer::Preview
  def invite_team_email  
    InviteTeamMailer.invite_team_email(Team.first, "aa@aa.c")
  end
end
