# typed: strong

module Anthropic
  module Models
    module OrganizationRole
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::OrganizationRole) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ADMIN = T.let(:admin, Anthropic::OrganizationRole::TaggedSymbol)
      BILLING = T.let(:billing, Anthropic::OrganizationRole::TaggedSymbol)
      CLAUDE_CODE_USER =
        T.let(:claude_code_user, Anthropic::OrganizationRole::TaggedSymbol)
      DEVELOPER = T.let(:developer, Anthropic::OrganizationRole::TaggedSymbol)
      MANAGED = T.let(:managed, Anthropic::OrganizationRole::TaggedSymbol)
      MEMBERSHIP_ADMIN =
        T.let(:membership_admin, Anthropic::OrganizationRole::TaggedSymbol)
      OWNER = T.let(:owner, Anthropic::OrganizationRole::TaggedSymbol)
      PRIMARY_OWNER =
        T.let(:primary_owner, Anthropic::OrganizationRole::TaggedSymbol)
      USER = T.let(:user, Anthropic::OrganizationRole::TaggedSymbol)

      sig do
        override.returns(T::Array[Anthropic::OrganizationRole::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
