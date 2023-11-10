class MonsterMailer < ApplicationMailer
  def reservation_email(user, monster, personal_message)
    @user = user
    @monster = monster
    @personal_message = personal_message
    mail(to: @monster.user.email, subject: 'Nouvelle Réservation de Monstre', from: @user.email)
  end
end
