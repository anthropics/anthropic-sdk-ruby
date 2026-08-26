# typed: strong

module Anthropic
  module Models
    BetaOrganizationRole = Beta::BetaOrganizationRole

    module Beta
      module BetaOrganizationRole
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::Beta::BetaOrganizationRole) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ADMIN =
          T.let(:admin, Anthropic::Beta::BetaOrganizationRole::TaggedSymbol)
        BILLING =
          T.let(:billing, Anthropic::Beta::BetaOrganizationRole::TaggedSymbol)
        CLAUDE_CODE_USER =
          T.let(
            :claude_code_user,
            Anthropic::Beta::BetaOrganizationRole::TaggedSymbol
          )
        DEVELOPER =
          T.let(:developer, Anthropic::Beta::BetaOrganizationRole::TaggedSymbol)
        MANAGED =
          T.let(:managed, Anthropic::Beta::BetaOrganizationRole::TaggedSymbol)
        MEMBERSHIP_ADMIN =
          T.let(
            :membership_admin,
            Anthropic::Beta::BetaOrganizationRole::TaggedSymbol
          )
        OWNER =
          T.let(:owner, Anthropic::Beta::BetaOrganizationRole::TaggedSymbol)
        PRIMARY_OWNER =
          T.let(
            :primary_owner,
            Anthropic::Beta::BetaOrganizationRole::TaggedSymbol
          )
        USER = T.let(:user, Anthropic::Beta::BetaOrganizationRole::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaOrganizationRole::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
