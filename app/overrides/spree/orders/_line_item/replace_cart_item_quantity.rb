# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/orders/_line_item_data',
  name: 'removing cart_item_quantity option',
  replace_contents: '[data-hook="cart_item_quantity"]',
  text: <<-HTML
            <% unless line_item.gift_card.present? %>
              <div class="d-flex align-items-center">
                <%= button_tag '-', type: 'button', class: "border-right-0 shopping-cart-item-quantity-decrease-btn", data: { id: dom_id(line_item) } %>
                <%= item_form.number_field :quantity, min: 0, class: "form-control text-center border-left-0 border-right-0 shopping-cart-item-quantity-input", size: 5, data: { id: dom_id(line_item) } %>
                <%= button_tag '+', type: 'button', class: "border-left-0 shopping-cart-item-quantity-increase-btn", data: { id: dom_id(line_item) } %>
              </div>
            <% end %>
  HTML
)
