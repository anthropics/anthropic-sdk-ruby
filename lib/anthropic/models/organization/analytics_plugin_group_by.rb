# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # A dimension to group plugin activity by.
      module AnalyticsPluginGroupBy
        extend Anthropic::Internal::Type::Enum

        PRODUCT = :product
        RBAC_GROUP_ID = :rbac_group_id
        USER_ID = :user_id

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
