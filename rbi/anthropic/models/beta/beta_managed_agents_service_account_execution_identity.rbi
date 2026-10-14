# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsServiceAccountExecutionIdentity =
      Beta::BetaManagedAgentsServiceAccountExecutionIdentity

    module Beta
      class BetaManagedAgentsServiceAccountExecutionIdentity < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsServiceAccountExecutionIdentity,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The Anthropic-managed service account as returned in API responses.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :service_account)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
