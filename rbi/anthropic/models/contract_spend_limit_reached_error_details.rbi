# typed: strong

module Anthropic
  module Models
    class ContractSpendLimitReachedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ContractSpendLimitReachedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The organization has reached the spend limit of its contract.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :contract_spend_limit_reached)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
