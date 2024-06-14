namespace :offers do
  desc "This task send the offer for a player"
  task send: :environment do
    OfferSenderService.call
  end
end
