# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsServiceAccountExecutionIdentityParams =
      Beta::BetaManagedAgentsServiceAccountExecutionIdentityParams

    module Beta
      class BetaManagedAgentsServiceAccountExecutionIdentityParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsServiceAccountExecutionIdentityParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The Anthropic-managed service account — the default execution principal. Carries
        # no identifier.
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
