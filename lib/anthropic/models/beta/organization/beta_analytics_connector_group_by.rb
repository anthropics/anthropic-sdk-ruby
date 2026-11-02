# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # A dimension to group connector activity by.
        module BetaAnalyticsConnectorGroupBy
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
end
