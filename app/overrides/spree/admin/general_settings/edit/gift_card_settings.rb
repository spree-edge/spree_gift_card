# frozen_string_literal: true

Deface::Override.new(
  virtual_path: 'spree/admin/general_settings/edit',
  name: 'Add instance index key',
  insert_after: 'div[data-hook="general_settings_cache"]',
  text: <<-HTML
            <%#-------------------------------------------------%>
            <%# Gift Card Setting                          %>
            <%#-------------------------------------------------%>

            <div class="card mb-3">
              <div class="card-header">
                <h1 class="card-title mb-0 h5">
                  <%= Spree.t(:gift_card_settings) %>
                </h1>
              </div>

              <div class="card-body">
                <div class="form-group">
                  <%= label_tag :allow_gift_card_redeem do %>
                    <%= check_box_tag :allow_gift_card_redeem, 1, Spree::Config.allow_gift_card_redeem %>
                    <%= Spree.t(:allow_gift_card_redeem) %>
                  <% end %>
                </div>
              </div>
            </div>
  HTML
)