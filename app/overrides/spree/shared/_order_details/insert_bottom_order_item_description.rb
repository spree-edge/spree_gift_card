# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/shared/_order_details',
  name: 'gift items',
  insert_bottom: 'td[data-hook=order_item_description]',
  text: <<-HTML
                    <% if item.gift_card %>
                      <br/><b><%= Spree.t(:for) %>:</b> <%= item.gift_card.name %> (<%= item.gift_card.email %>)
                      <br/><b><%= Spree.t(:note) %>:</b> <%= item.gift_card.note %>
                    <% end %>
  HTML
)
