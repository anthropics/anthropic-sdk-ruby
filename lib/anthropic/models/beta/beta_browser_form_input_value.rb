# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaBrowserFormInputValue
        extend Anthropic::Internal::Type::Union

        variant String

        variant Float

        variant Anthropic::Internal::Type::Boolean

        # @!method self.variants
        #   @return [Array(String, Float, Boolean)]
      end
    end

    BetaBrowserFormInputValue = Beta::BetaBrowserFormInputValue
  end
end
