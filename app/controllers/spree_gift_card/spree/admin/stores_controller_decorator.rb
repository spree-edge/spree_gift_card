module SpreeGiftCard
  module Spree
    module Admin
      module StoresControllerDecorator
        def self.prepended(base)
          base.after_action :update_preferences, only: [:update]
        end

        private
        def update_preferences
          return unless @store.save

          ::Spree::Config.set(allow_gift_card_redeem: params[:allow_gift_card_redeem] == '1')
        end
      end
    end
  end
end

::Spree::Admin::StoresController.prepend SpreeGiftCard::Spree::Admin::StoresControllerDecorator
