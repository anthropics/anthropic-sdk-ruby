# frozen_string_literal: true

module Anthropic
  module Models
    # The next step on this enforcement action: `verify` means the end user can clear
    # the action by passing an identity check. More values may be added; read a value
    # you do not recognize as `null`.
    module UserProfileEnforcementActionNextStep
      extend Anthropic::Internal::Type::Enum

      VERIFY = :verify

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
