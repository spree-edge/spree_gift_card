# frozen_string_literal: true

module SpreeGiftCard
  module Spree
    module AdjustmentDecorator
      def self.prepended(base)
        base.scope :gift_card, -> { where(source_type: 'Spree::GiftCard') }
      end
    end
  end
end

::Spree::Adjustment.prepend SpreeGiftCard::Spree::AdjustmentDecorator
