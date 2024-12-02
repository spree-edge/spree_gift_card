# frozen_string_literal: true

module SpreeGiftCard
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.has_many :user_gift_cards
        base.has_many :gift_cards, through: :user_gift_cards
      end
    end
  end
end

::Spree::User.prepend SpreeGiftCard::Spree::UserDecorator
