# frozen_string_literal: true

class AddStateToGiftCard < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_gift_cards, :state, :string
  end
end
