# typed: strong

module Anthropic
  module Models
    BetaMCPToolConfig = Beta::BetaMCPToolConfig

    module Beta
      class BetaMCPToolConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMCPToolConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        # Configuration for a specific tool in an MCP toolset.
        sig do
          params(defer_loading: T::Boolean, enabled: T::Boolean).returns(
            T.attached_class
          )
        end
        def self.new(defer_loading: nil, enabled: nil)
        end

        sig do
          override.returns({ defer_loading: T::Boolean, enabled: T::Boolean })
        end
        def to_hash
        end
      end
    end
  end
end
