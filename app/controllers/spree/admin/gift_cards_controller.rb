# frozen_string_literal: true
module Spree
  module Admin
    class GiftCardsController < Spree::Admin::ResourceController
      before_action :set_gift_card, :find_gift_card_variant, except: :destroy
      before_action :find_gift_card, only: %i[edit show update resend]

      def create
        @object.assign_attributes(gift_card_params)
        @object.variant_id = @gift_card_variant_id
        @object.current_value = @object.original_value
        if @object.save
          flash[:success] = Spree.t(:successfully_created_gift_card)
          redirect_to admin_gift_cards_path
        else
          redirect_to new_gift_card_path
        end
      end

      def show; end

      def edit; end

      def update
        flash[:success] = Spree.t(:successfully_updated_gift_card) if @gift_card.update(gift_card_params)
        redirect_to admin_gift_cards_path
      end

      def resend
        order = @gift_card.order

        if order.present?
          order.update_columns(gift_card_notified: false) # Reset notified flag.
          order.gift_card_notification
          flash[:success] = Spree.t(:gift_card_email_resent)
        else
          flash[:error] = Spree.t(:gift_card_order_not_found)
        end

        redirect_back fallback_location: spree.edit_admin_gift_card_url(@gift_card)
      end

      private

      def collection
        super.order(created_at: :desc).page(params[:page]).per(Spree::Backend::Config[:admin_orders_per_page])
      end

      def set_gift_card
        @is_e_gift_card = request.path.include?('new-digital') || (params[:gift_card].present? && params[:gift_card][:e_gift_card] == 'true')
      end

      def find_gift_card_variant
        products = Product.not_deleted.gift_cards
        products = if @is_e_gift_card
                     products.e_gift_cards
                   else
                     products.not_e_gift_cards
                   end
        @gift_card_variant_id = products&.first&.master&.id
      end

      def gift_card_params
        params.require(:gift_card).permit(
          :email,
          :name,
          :note,
          :original_value,
          :sender_name,
          :sender_email,
          :delivery_on,
          :state
        )
      end

      def find_gift_card
        @gift_card = Spree::GiftCard.find_by(id: params[:id])
      end
    end
  end
end
