Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
    Rails.application.config.spree_backend.main_menu.add(
      ::Spree::Admin::MainMenu::ItemBuilder.new(
        'gift_cards',
        ::Spree::Core::Engine.routes.url_helpers.admin_gift_cards_path
      )
      .with_icon_key('gift.svg')
      .with_manage_ability_check(::Spree::GiftCard)
      .with_match_path('/gift-card')
      .build
    )
  end
end
