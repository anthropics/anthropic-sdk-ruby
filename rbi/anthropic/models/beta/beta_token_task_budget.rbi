# typed: strong

module Anthropic
  module Models
    BetaTokenTaskBudget = Beta::BetaTokenTaskBudget

    module Beta
      class BetaTokenTaskBudget < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTokenTaskBudget,
              Anthropic::Internal::AnyHash
            )
          end

        # Total token budget across all contexts in the session.
        sig { returns(Integer) }
        attr_accessor :total

        # The budget type. Currently only 'tokens' is supported.
        sig { returns(Symbol) }
        attr_accessor :type

        # Remaining tokens in the budget. Use this to track usage across contexts when
        # implementing compaction client-side. Defaults to total if not provided.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :remaining

        # User-configurable total token budget across contexts.
        sig do
          params(
            total: Integer,
            remaining: T.nilable(Integer),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Total token budget across all contexts in the session.
          total:,
          # Remaining tokens in the budget. Use this to track usage across contexts when
          # implementing compaction client-side. Defaults to total if not provided.
          remaining: nil,
          # The budget type. Currently only 'tokens' is supported.
          type: :tokens
        )
        end

        sig do
          override.returns(
            { total: Integer, type: Symbol, remaining: T.nilable(Integer) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
