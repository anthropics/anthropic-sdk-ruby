# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSelfHostedResourcesUnsupportedRunError =
      Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError

    module Beta
      class BetaManagedAgentsSelfHostedResourcesUnsupportedRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment configures resources, but its environment is self-hosted and
        # cannot mount them.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SELF_HOSTED_RESOURCES_UNSUPPORTED_ERROR =
            T.let(
              :self_hosted_resources_unsupported_error,
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type::TaggedSymbol
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
