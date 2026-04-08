# typed: strong

module Anthropic
  module Models
    BetaCloudConfigParams = Beta::BetaCloudConfigParams

    module Beta
      class BetaCloudConfigParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCloudConfigParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Environment type
        sig { returns(Symbol) }
        attr_accessor :type

        # Network configuration policy. Omit on update to preserve the existing value.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaUnrestrictedNetwork,
                Anthropic::Beta::BetaLimitedNetworkParams
              )
            )
          )
        end
        attr_accessor :networking

        # Specify packages (and optionally their versions) available in this environment.
        #
        # When versioning, use the version semantics relevant for the package manager,
        # e.g. for `pip` use `package==1.0.0`. You are responsible for validating the
        # package and version exist. Unversioned installs the latest.
        sig { returns(T.nilable(Anthropic::Beta::BetaPackagesParams)) }
        attr_reader :packages

        sig do
          params(
            packages: T.nilable(Anthropic::Beta::BetaPackagesParams::OrHash)
          ).void
        end
        attr_writer :packages

        # Request params for `cloud` environment configuration.
        #
        # Fields default to null; on update, omitted fields preserve the existing value.
        sig do
          params(
            networking:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaUnrestrictedNetwork::OrHash,
                  Anthropic::Beta::BetaLimitedNetworkParams::OrHash
                )
              ),
            packages: T.nilable(Anthropic::Beta::BetaPackagesParams::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Network configuration policy. Omit on update to preserve the existing value.
          networking: nil,
          # Specify packages (and optionally their versions) available in this environment.
          #
          # When versioning, use the version semantics relevant for the package manager,
          # e.g. for `pip` use `package==1.0.0`. You are responsible for validating the
          # package and version exist. Unversioned installs the latest.
          packages: nil,
          # Environment type
          type: :cloud
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              networking:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaUnrestrictedNetwork,
                    Anthropic::Beta::BetaLimitedNetworkParams
                  )
                ),
              packages: T.nilable(Anthropic::Beta::BetaPackagesParams)
            }
          )
        end
        def to_hash
        end

        # Network configuration policy. Omit on update to preserve the existing value.
        module Networking
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaUnrestrictedNetwork,
                Anthropic::Beta::BetaLimitedNetworkParams
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaCloudConfigParams::Networking::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
