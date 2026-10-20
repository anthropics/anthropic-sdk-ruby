# frozen_string_literal: true

module Anthropic
  module Models
    # A user profile's status in a program. Each program's `status` field says what
    # the values mean there.
    module UserProfileProgramStatus
      extend Anthropic::Internal::Type::Enum

      # The profile is in the program.
      ACTIVE = :active

      # The profile is not in the program yet, and something is still awaited.
      PENDING = :pending

      # The profile is not in the program and nothing is awaited: Anthropic has declined, or has withdrawn an earlier approval.
      REJECTED = :rejected

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
