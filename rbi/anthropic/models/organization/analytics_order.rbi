# typed: strong

module Anthropic
  module Models
    module Organization
      # Sort direction: `asc` or `desc`. Defaults to `asc` for the endpoint's sort
      # column and to `desc` when `order_by` names a metric (a top-N ranking). Applies
      # to `order_by`, or to the endpoint's default sort field when `order_by` is
      # omitted.
      module AnalyticsOrder
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::AnalyticsOrder)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ASC = T.let(:asc, Anthropic::Organization::AnalyticsOrder::TaggedSymbol)
        DESC =
          T.let(:desc, Anthropic::Organization::AnalyticsOrder::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::Organization::AnalyticsOrder::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
