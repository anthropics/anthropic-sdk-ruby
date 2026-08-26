# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaNoBillingWorkspaceRole
          extend Anthropic::Internal::Type::Enum

          WORKSPACE_ADMIN = :workspace_admin
          WORKSPACE_DEVELOPER = :workspace_developer
          WORKSPACE_RESTRICTED_DEVELOPER = :workspace_restricted_developer
          WORKSPACE_USER = :workspace_user

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
