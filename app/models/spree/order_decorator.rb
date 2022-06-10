# frozen_string_literal: true

module Spree
  module OrderDecorator
    def self.prepended(base)
      base.include Spree::Order::GiftCard

      base.after_update :gift_card_notification, if: :complete?
    end

    def gift_card_notification
      gift_cards = line_items.map(&:gift_card).compact

      if gift_cards.present?
        gift_cards.each do |gift_card|
          SpreeGiftCard::SendEmailJob.set(wait: 1.week).perform_later(gift_card.id)
        end
      end
    end
  end
end

::Spree::Order.prepend(Spree::OrderDecorator)
