# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/orders/_line_item',
  name: 'gift card message',
  insert_bottom: '[data-hook="cart_item_description"]',
  text: <<-HTML
            <% if line_item.gift_card %>
              <br/><b><%= Spree.t(:to) %>:</b> <%= line_item.gift_card.name %> (<%= line_item.gift_card.email %>)
              <br/><b><%= Spree.t(:note) %>:</b> <%= line_item.gift_card.note %>
            <% end %>
  HTML
)
