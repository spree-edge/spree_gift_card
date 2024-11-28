# frozen_string_literal: true
module SpreeGiftCard
  module Spree
    module StoreCreditCategoryDecorator
      def self.prepended(base)
        base.scope :gift_card, -> { where(name: 'Gift Card') }
      end
    end
  end
end

::Spree::StoreCreditCategory.prepend SpreeGiftCard::Spree::StoreCreditCategoryDecorator
