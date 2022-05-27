# # frozen_string_literal: true

# Deface::Override.new(
#   virtual_path: 'spree/checkout/_payment',
#   name: 'add gift cards fields',
#   insert_bottom: '#payment',
#   text: <<-HTML
#           <div class="payment-sources mb-3 p-4">
#             <div id="gift-cards-fields">
#                 <%= form.label :gift_code %>
#                 <%= form.text_field :gift_code, value: nil, class: 'form-control' %>
#             </div>
#           </div>
#   HTML
# )
