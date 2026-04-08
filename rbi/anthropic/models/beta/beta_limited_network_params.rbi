# typed: strong

module Anthropic
  module Models
    BetaLimitedNetworkParams = Beta::BetaLimitedNetworkParams

    module Beta
      class BetaLimitedNetworkParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaLimitedNetworkParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Network policy type
        sig { returns(Symbol) }
        attr_accessor :type

        # Permits outbound access to MCP server endpoints configured on the agent, beyond
        # those listed in the `allowed_hosts` array. Defaults to `false`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :allow_mcp_servers

        # Permits outbound access to public package registries (PyPI, npm, etc.) beyond
        # those listed in the `allowed_hosts` array. Defaults to `false`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :allow_package_managers

        # Specifies domains the container can reach.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :allowed_hosts

        # Limited network request params.
        #
        # Fields default to null; on update, omitted fields preserve the existing value.
        sig do
          params(
            allow_mcp_servers: T.nilable(T::Boolean),
            allow_package_managers: T.nilable(T::Boolean),
            allowed_hosts: T.nilable(T::Array[String]),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Permits outbound access to MCP server endpoints configured on the agent, beyond
          # those listed in the `allowed_hosts` array. Defaults to `false`.
          allow_mcp_servers: nil,
          # Permits outbound access to public package registries (PyPI, npm, etc.) beyond
          # those listed in the `allowed_hosts` array. Defaults to `false`.
          allow_package_managers: nil,
          # Specifies domains the container can reach.
          allowed_hosts: nil,
          # Network policy type
          type: :limited
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              allow_mcp_servers: T.nilable(T::Boolean),
              allow_package_managers: T.nilable(T::Boolean),
              allowed_hosts: T.nilable(T::Array[String])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
