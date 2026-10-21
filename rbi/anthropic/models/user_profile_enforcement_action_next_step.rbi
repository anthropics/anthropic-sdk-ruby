# typed: strong

module Anthropic
  module Models
    # The next step on this enforcement action: `verify` means the end user can clear
    # the action by passing an identity check. More values may be added; read a value
    # you do not recognize as `null`.
    module UserProfileEnforcementActionNextStep
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias do
          T.all(Symbol, Anthropic::UserProfileEnforcementActionNextStep)
        end
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      VERIFY =
        T.let(
          :verify,
          Anthropic::UserProfileEnforcementActionNextStep::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[
            Anthropic::UserProfileEnforcementActionNextStep::TaggedSymbol
          ]
        )
      end
      def self.values
      end
    end
  end
end
