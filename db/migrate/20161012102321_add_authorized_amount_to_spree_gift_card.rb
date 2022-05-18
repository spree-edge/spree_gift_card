# frozen_string_literal: true

class AddAuthorizedAmountToSpreeGiftCard < ActiveRecord::Migration[4.2]
  def change
    unless column_exists?(
      :spree_gift_cards, :authorized_amount
    )
      add_column :spree_gift_cards, :authorized_amount, :decimal, precision: 8, scale: 2, null: false,
                                                                  default: 0.0
    end
  end
end
