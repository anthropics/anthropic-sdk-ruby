# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaOrganizationRole
        extend Anthropic::Internal::Type::Enum

        ADMIN = :admin
        BILLING = :billing
        CLAUDE_CODE_USER = :claude_code_user
        DEVELOPER = :developer
        MANAGED = :managed
        MEMBERSHIP_ADMIN = :membership_admin
        OWNER = :owner
        PRIMARY_OWNER = :primary_owner
        USER = :user

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaOrganizationRole = Beta::BetaOrganizationRole
  end
end
