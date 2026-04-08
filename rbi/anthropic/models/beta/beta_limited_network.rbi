# typed: strong

module Anthropic
  module Models
    BetaLimitedNetwork = Beta::BetaLimitedNetwork

    module Beta
      class BetaLimitedNetwork < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaLimitedNetwork,
              Anthropic::Internal::AnyHash
            )
          end

        # Permits outbound access to MCP server endpoints configured on the agent, beyond
        # those listed in the `allowed_hosts` array.
        sig { returns(T::Boolean) }
        attr_accessor :allow_mcp_servers

        # Permits outbound access to public package registries (PyPI, npm, etc.) beyond
        # those listed in the `allowed_hosts` array.
        sig { returns(T::Boolean) }
        attr_accessor :allow_package_managers

        # Specifies domains the container can reach.
        sig { returns(T::Array[String]) }
        attr_accessor :allowed_hosts

        # Network policy type
        sig { returns(Symbol) }
        attr_accessor :type

        # Limited network access.
        sig do
          params(
            allow_mcp_servers: T::Boolean,
            allow_package_managers: T::Boolean,
            allowed_hosts: T::Array[String],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Permits outbound access to MCP server endpoints configured on the agent, beyond
          # those listed in the `allowed_hosts` array.
          allow_mcp_servers:,
          # Permits outbound access to public package registries (PyPI, npm, etc.) beyond
          # those listed in the `allowed_hosts` array.
          allow_package_managers:,
          # Specifies domains the container can reach.
          allowed_hosts:,
          # Network policy type
          type: :limited
        )
        end

        sig do
          override.returns(
            {
              allow_mcp_servers: T::Boolean,
              allow_package_managers: T::Boolean,
              allowed_hosts: T::Array[String],
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
