# frozen_string_literal: true

module Spree
  module GiftCardsHelper
    def variants_values(gift_card_variants)
      gift_card_variants.map { |variant| ["#{variant.product.name}".downcase , variant.id] }
    end
  end
end
