# frozen_string_literal: true

require_dependency 'spree/calculator'

module Spree
  module Calculator
    class GiftCardCalculator < Calculator
      def self.description
        Spree.t(:gift_card_calculator)
      end

      def compute(order, gift_card)
        [order.total, gift_card.current_value].min * -1
      end
    end
  end
end
