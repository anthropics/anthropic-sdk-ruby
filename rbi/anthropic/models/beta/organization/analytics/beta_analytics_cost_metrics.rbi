# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class BetaAnalyticsCostMetrics < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostMetrics,
                  Anthropic::Internal::AnyHash
                )
              end

            # Amount (post-discount, pre-credit) in fractional cents (minor units).
            sig { returns(String) }
            attr_accessor :amount

            # Currency code for the cost amount. Currently always `"USD"`.
            sig { returns(String) }
            attr_accessor :currency

            # List-price amount (pre-discount) in fractional cents.
            sig { returns(String) }
            attr_accessor :list_amount

            # Number of API requests in this row's scope. Null when `group_by` includes
            # `cost_type` or `token_type` (the count has no per-component attribution; read it
            # from the ungrouped response). For sandbox / code-execution events, this counts
            # execution spans rather than HTTP requests (these rows surface with
            # `product: null`).
            sig { returns(T.nilable(Integer)) }
            attr_accessor :requests

            # The cost of one row.
            sig do
              params(
                amount: String,
                currency: String,
                list_amount: String,
                requests: T.nilable(Integer)
              ).returns(T.attached_class)
            end
            def self.new(
              # Amount (post-discount, pre-credit) in fractional cents (minor units).
              amount:,
              # Currency code for the cost amount. Currently always `"USD"`.
              currency:,
              # List-price amount (pre-discount) in fractional cents.
              list_amount:,
              # Number of API requests in this row's scope. Null when `group_by` includes
              # `cost_type` or `token_type` (the count has no per-component attribution; read it
              # from the ungrouped response). For sandbox / code-execution events, this counts
              # execution spans rather than HTTP requests (these rows surface with
              # `product: null`).
              requests:
            )
            end

            sig do
              override.returns(
                {
                  amount: String,
                  currency: String,
                  list_amount: String,
                  requests: T.nilable(Integer)
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
