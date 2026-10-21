# frozen_string_literal: true

module Anthropic
  module Models
    # Anthropic's enforcement status of this profile: `unrestricted`, `pending`,
    # `restricted` or `banned`. More values may be added; read a value you do not
    # recognize as `restricted`.
    module UserProfileEnforcementStatus
      extend Anthropic::Internal::Type::Enum

      UNRESTRICTED = :unrestricted
      PENDING = :pending
      RESTRICTED = :restricted
      BANNED = :banned

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
