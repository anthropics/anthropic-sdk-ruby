# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Who is billed for a request.
      module BetaBillTo
        extend Anthropic::Internal::Type::Enum

        SELF = :self
        USER_PROFILE = :user_profile

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaBillTo = Beta::BetaBillTo
  end
end
