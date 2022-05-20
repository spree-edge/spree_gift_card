# frozen_string_literal: true

module SpreeGiftCard
  class SendEmailJob < ApplicationJob
    queue_as :default

    def perform(*_args)
      gift_cards = Spree::GiftCard
                   .deliverable
                   .where.not(line_item: nil)

      gift_cards.each do |gift_card|
        next unless gift_card_shipped(gift_card)

        order_id = gift_card.line_item.order.id
        Spree::OrderMailer.gift_card_email(gift_card.id, order_id).deliver_later
      end
    end

    def gift_card_shipped(gift_card)
      gift_card.line_item.inventory_units.all?(&:shipped?)
    end
  end
end
