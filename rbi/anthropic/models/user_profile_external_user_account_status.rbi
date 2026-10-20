# typed: strong

module Anthropic
  module Models
    # The status of the entity's account on the platform, as the platform states it:
    # `active`; `suspended`, when the platform has restricted the account and may
    # restore it; or `blocked`, when the platform has barred it. It records the
    # platform's decision only. The statuses that Anthropic itself reports for the
    # profile, such as its status in a program, are Anthropic's decisions and do not
    # change with it.
    module UserProfileExternalUserAccountStatus
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias do
          T.all(Symbol, Anthropic::UserProfileExternalUserAccountStatus)
        end
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      # The platform has neither restricted nor barred the account of the entity that the user profile represents.
      ACTIVE =
        T.let(
          :active,
          Anthropic::UserProfileExternalUserAccountStatus::TaggedSymbol
        )

      # The platform has restricted the account of the entity that the user profile represents and may restore it.
      SUSPENDED =
        T.let(
          :suspended,
          Anthropic::UserProfileExternalUserAccountStatus::TaggedSymbol
        )

      # The platform has barred the account of the entity that the user profile represents.
      BLOCKED =
        T.let(
          :blocked,
          Anthropic::UserProfileExternalUserAccountStatus::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[
            Anthropic::UserProfileExternalUserAccountStatus::TaggedSymbol
          ]
        )
      end
      def self.values
      end
    end
  end
end
