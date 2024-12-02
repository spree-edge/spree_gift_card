# frozen_string_literal: true

class SpreeGiftCardNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_orders, :gift_card_notified, :boolean, default: false
    add_column :spree_gift_cards, :gift_card_notified, :boolean, default: false
  end
end
