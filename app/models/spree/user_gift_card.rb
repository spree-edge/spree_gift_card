# frozen_string_literal: true

module Spree
  class UserGiftCard < Spree::Base
    belongs_to :gift_card
    belongs_to :user
  end
end
