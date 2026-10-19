# frozen_string_literal: true

module Anthropic
  module Models
    # Sort field for listing user profiles: `created_at` (default) or `name`
    # (case-insensitive; profiles without a name sort last).
    module UserProfileListOrderBy
      extend Anthropic::Internal::Type::Enum

      # Sort by when each user profile was created. This is the default.
      CREATED_AT = :created_at

      # Sort by `name`, ignoring the case of ASCII letters. Profiles without a name come last in either direction.
      NAME = :name

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
