# frozen_string_literal: true

module Anthropic
  module Models
    # The direction that a list of user profiles is sorted in.
    module UserProfileListOrder
      extend Anthropic::Internal::Type::Enum

      # Oldest first when `order_by` is `created_at`, or names in ascending order when `order_by` is `name`.
      ASC = :asc

      # Newest first when `order_by` is `created_at`, or names in descending order when `order_by` is `name`. This is the default.
      DESC = :desc

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
