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

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaCloudConfig::Networking::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
