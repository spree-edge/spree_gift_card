# frozen_string_literal: true

module Spree
  module OrderMailerDecorator
    def gift_card_receiver(card_id, order_id)
      @gift_card = Spree::GiftCard.find_by(id: card_id)
      @order = Spree::Order.find_by(id: order_id)
      subject = "#{Spree::Store.current.name} #{Spree.t('gift_card_email.subject')}"
      @gift_card.update_columns(sent_at: Time.now, gift_card_notified: true)

      mail(
        to: @gift_card.email,
        from: from_address,
        subject: subject
      )
    end

    def gift_card_sender(card_id, order_id)
      @gift_card = Spree::GiftCard.find_by(id: card_id)
      return unless @gift_card.sender_email

      @order = Spree::Order.find_by(id: order_id)
      subject = "#{Spree::Store.current.name} Notification! Gift Card delivered!"
      mail(
        to: @gift_card.sender_email,
        from: from_address,
        subject: subject
      )
    end
  end
end

::Spree::OrderMailer.prepend(Spree::OrderMailerDecorator)
