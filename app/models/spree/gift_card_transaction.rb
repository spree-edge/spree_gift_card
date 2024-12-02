# frozen_string_literal: true

module Spree
  class GiftCardTransaction < Spree::Base
    belongs_to :gift_card
    belongs_to :order

    validates :amount, :gift_card, presence: true
  end
end
