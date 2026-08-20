# typed: strong

module Anthropic
  module Models
    BetaCloudConfig = Beta::BetaCloudConfig

    module Beta
      class BetaCloudConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCloudConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # Network configuration policy.
        sig { returns(Anthropic::Beta::BetaCloudConfig::Networking::Variants) }
        attr_accessor :networking

        # Package manager configuration.
        sig { returns(Anthropic::Beta::BetaPackages) }
        attr_reader :packages

        sig { params(packages: Anthropic::Beta::BetaPackages::OrHash).void }
        attr_writer :packages

        # Environment type
        sig { returns(Symbol) }
        attr_accessor :type

        # `cloud` environment configuration.
        sig do
          params(
            networking:
              T.any(
                Anthropic::Beta::BetaUnrestrictedNetwork::OrHash,
                Anthropic::Beta::BetaLimitedNetwork::OrHash
              ),
            packages: Anthropic::Beta::BetaPackages::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Network configuration policy.
          networking:,
          # Package manager configuration.
          packages:,
          # Environment type
          type: :cloud
        )
        end

        sig do
          override.returns(
            {
              networking:
                Anthropic::Beta::BetaCloudConfig::Networking::Variants,
              packages: Anthropic::Beta::BetaPackages,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # Network configuration policy.
        module Networking
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaUnrestrictedNetwork,
                Anthropic::Beta::BetaLimitedNetwork
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaCloudConfig::Networking::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            UNRESTRICTED =
              T.let(
                :unrestricted,
                Anthropic::Beta::BetaCloudConfig::Networking::Type::TaggedSymbol
              )
            LIMITED =
              T.let(
                :limited,
                Anthropic::Beta::BetaCloudConfig::Networking::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaCloudConfig::Networking::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaCloudConfig::Networking::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              allow_mcp_servers: T::Boolean,
              allow_package_managers: T::Boolean,
              allowed_hosts: T::Array[String]
            ).returns(Anthropic::Beta::BetaCloudConfig::Networking::Variants)
          end
          def self.new(
            type:,
            # Permits outbound access to MCP server endpoints configured on the agent, beyond
            # those listed in the `allowed_hosts` array.
            allow_mcp_servers: nil,
            # Permits outbound access to public package registries (PyPI, npm, etc.) beyond
            # those listed in the `allowed_hosts` array.
            allow_package_managers: nil,
            # Specifies domains the container can reach.
            allowed_hosts: nil
          )
          end
        end
      end
    end
  end
end
