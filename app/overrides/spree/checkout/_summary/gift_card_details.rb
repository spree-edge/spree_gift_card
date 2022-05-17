Deface::Override.new(
  virtual_path: 'spree/checkout/_summary',
  name: 'add gift cards detail on order summary',
  insert_after: 'div[data-hook="order_summary"]',
  text: <<-HTML
    <% if order.using_gift_card? %>
      <tr data-hook="order_details_gift_card">
        <td><%= Spree.t(:gift_card) %>:</strong></td>
        <td><span id='summary-gift-card'><%= order.display_total_applied_gift_card.to_html %></span></td>
      </tr>
    <% end %>
  HTML
)
