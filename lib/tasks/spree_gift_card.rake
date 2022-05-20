namespace :gift_cards do
  desc 'Sends outstanding gift card emails'
  task send: :environment do
    SpreeGiftCard::SendEmailJob.perform_now
  end
end
