# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'add gift cards tab',
  insert_bottom: 'nav',
  text: <<-HTML
    <ul class="nav nav-sidebar border-bottom">
      <%= tab(:gift_cards, spree.admin_gift_cards_path, icon: 'gift') %>
    </ul>

  HTML
)
