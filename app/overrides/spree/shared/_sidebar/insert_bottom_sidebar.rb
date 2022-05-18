# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/shared/_sidebar',
  name: 'gift sidebar',
  insert_bottom: 'aside#sidebar',
  text: <<-HTML
                    <div class="list-group">
                      <%= link_to Spree.t("buy_gift_card"), new_gift_card_path, class: 'list-group-item' %>
                    </div>
                    <div class="list-group">
                      <%= link_to Spree.t("buy_e_gift_card"), new_gift_card_path(e: true), class: 'list-group-item' %>
                    </div>
  HTML
)
