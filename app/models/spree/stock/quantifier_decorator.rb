# frozen_string_literal: true

module Spree
  module Stock
    module QuantifierDecorator
      include Spree::QuantifierCanSupply
    end
  end
end

::Spree::Stock::Quantifier.prepend(Spree::Stock::QuantifierDecorator)
