# typed: strong

module Anthropic
  module Models
    module Organization
      module SpendLimitPeriod
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::SpendLimitPeriod)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DAILY =
          T.let(:daily, Anthropic::Organization::SpendLimitPeriod::TaggedSymbol)
        MONTHLY =
          T.let(
            :monthly,
            Anthropic::Organization::SpendLimitPeriod::TaggedSymbol
          )
        WEEKLY =
          T.let(
            :weekly,
            Anthropic::Organization::SpendLimitPeriod::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::Organization::SpendLimitPeriod::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
