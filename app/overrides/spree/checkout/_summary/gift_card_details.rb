# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/checkout/_summary',
  name: 'add gift cards detail on order summary',
  insert_bottom: 'div[data-hook="order_summary"]',
  text: <<-HTML
    <% if order.using_gift_card? %>
      <% order_vat = order.display_vat %>
      <div class="d-table-cell"><%= Spree.t(:gift_card) %></div>
      <div class="d-table-cell text-right"><%= order.display_total_applied_gift_card.to_html %></div>
    <% end %>
  HTML
)
