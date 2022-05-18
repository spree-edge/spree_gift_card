# frozen_string_literal: true

module Spree
  module OrderDecorator
    def self.prepended(base)
      base.include Spree::Order::GiftCard
    end
  end
end

::Spree::Order.prepend(Spree::OrderDecorator)
