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

        # A monetary amount in a specific currency.
        sig { returns(Anthropic::BetaMonetaryAmount) }
        attr_reader :max_list_cost

        sig do
          params(max_list_cost: Anthropic::BetaMonetaryAmount::OrHash).void
        end
        attr_writer :max_list_cost

        sig do
          returns(Anthropic::Beta::BetaManagedAgentsBudgetLimit::Type::OrSymbol)
        end
        attr_accessor :type

        # A hard spend ceiling. The session stops issuing new model requests once the
        # tracked list cost reaches `max_list_cost`.
        sig do
          params(
            max_list_cost: Anthropic::BetaMonetaryAmount::OrHash,
            type: Anthropic::Beta::BetaManagedAgentsBudgetLimit::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A monetary amount in a specific currency.
          max_list_cost:,
          type:
        )
        end

        sig do
          override.returns(
            {
              max_list_cost: Anthropic::BetaMonetaryAmount,
              type:
                Anthropic::Beta::BetaManagedAgentsBudgetLimit::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsBudgetLimit::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LIMIT =
            T.let(
              :limit,
              Anthropic::Beta::BetaManagedAgentsBudgetLimit::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsBudgetLimit::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
