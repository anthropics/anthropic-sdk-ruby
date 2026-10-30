# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # A dimension to group user activity by.
      module AnalyticsUserGroupBy
        extend Anthropic::Internal::Type::Enum

        RBAC_GROUP_ID = :rbac_group_id

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
