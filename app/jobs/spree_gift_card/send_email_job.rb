# frozen_string_literal: true

module SpreeGiftCard
  class SendEmailJob < ApplicationJob
    queue_as :gift_card

    def perform(gift_card_id)
      gift_card = Spree::GiftCard.find_by(id: gift_card_id)

      if gift_card.present?
        order_id = gift_card.line_item.order.id

        Spree::OrderMailer.gift_card_receiver(gift_card.id, order_id).deliver_later
        Spree::OrderMailer.gift_card_sender(gift_card.id, order_id).deliver_later
      end
    end
  end
end
