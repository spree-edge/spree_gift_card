# frozen_string_literal: true

module SpreeGiftCard
  module Spree
    module OrderContentsDecorator
      def grab_line_item_by_variant(variant, raise_error = false, options = {})
        return if variant.product.is_gift_card?

        line_item = order.find_line_item_by_variant(variant, options)

        if !line_item.present? && raise_error
          raise ActiveRecord::RecordNotFound, "Line item not found for variant #{variant.sku}"
        end

        line_item
      end
    end
  end
end

::Spree::OrderContents.prepend SpreeGiftCard::Spree::OrderContentsDecorator if Spree.version.to_f < 3.7
