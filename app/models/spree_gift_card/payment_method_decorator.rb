# frozen_string_literal: true

module SpreeGiftCard
  module Spree
    module PaymentMethodDecorator
      def self.prepended(base)
        base.scope :gift_card, -> { where(type: 'Spree::PaymentMethod::GiftCard') }
      end

      def gift_card?
        instance_of?(::Spree::PaymentMethod::GiftCard)
      end
    end
  end
end

::Spree::PaymentMethod.prepend SpreeGiftCard::Spree::PaymentMethodDecorator
