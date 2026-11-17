# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject =
      Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject

    module Beta
      class BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        # The deployment configures resources, but its environment is self-hosted and
        # cannot mount them.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :self_hosted_resources_unsupported_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
