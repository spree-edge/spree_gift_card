class AddActionAndAuthorizationCodeToSpreeGiftCardTransaction < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_gift_card_transactions, :action, :string unless column_exists?(:spree_gift_card_transactions, :action)
    add_column :spree_gift_card_transactions, :authorization_code, :string unless column_exists?(:spree_gift_card_transactions, :authorization_code)
  end
end
