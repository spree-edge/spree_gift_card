# frozen_string_literal: true

module Spree
  module OrderDecorator
    def self.prepended(base)
      base.include Spree::Order::GiftCard

      base.after_update :gift_card_notification, if: :complete?

      base.after_update :giftcard_state_completed, if: :complete?
    end

    def gift_card_notification
      gift_cards = line_items.map(&:gift_card).compact

      if gift_cards.present? && !gift_card_notified
        gift_cards.each do |gift_card|
          SpreeGiftCard::SendEmailJob.set(wait_until: gift_card&.delivery_on).perform_later(gift_card.id)
        end
      end

      update_columns(gift_card_notified: true)
    end

    def giftcard_state_completed
      gift_cards = line_items.map(&:gift_card).compact

      gift_cards.each do |gift_card|
        gift_card.complete
      end
    end
  end
end

::Spree::Order.prepend(Spree::OrderDecorator)
