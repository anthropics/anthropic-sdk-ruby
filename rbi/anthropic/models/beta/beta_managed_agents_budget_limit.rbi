# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsBudgetLimit = Beta::BetaManagedAgentsBudgetLimit

    module Beta
      class BetaManagedAgentsBudgetLimit < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsBudgetLimit,
              Anthropic::Internal::AnyHash
            )
          end

        # Maximum list cost the session may accrue. List price is used regardless of any
        # negotiated discount, so the cap fires at or before the actual charge.
        sig { returns(Anthropic::BetaMonetaryAmount) }
        attr_reader :max_list_cost

        sig do
          params(max_list_cost: Anthropic::BetaMonetaryAmount::OrHash).void
        end
        attr_writer :max_list_cost

        sig { returns(Symbol) }
        attr_accessor :type

        # A hard spend ceiling. The session stops issuing new model requests once the
        # tracked list cost reaches `max_list_cost`.
        sig do
          params(
            max_list_cost: Anthropic::BetaMonetaryAmount::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Maximum list cost the session may accrue. List price is used regardless of any
          # negotiated discount, so the cap fires at or before the actual charge.
          max_list_cost:,
          type: :limit
        )
        end

        sig do
          override.returns(
            { max_list_cost: Anthropic::BetaMonetaryAmount, type: Symbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
