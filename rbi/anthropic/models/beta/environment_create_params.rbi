# typed: strong

module Anthropic
  module Models
    module Beta
      class EnvironmentCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::EnvironmentCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable name for the environment
        sig { returns(String) }
        attr_accessor :name

        # Environment configuration
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaCloudConfigParams,
                Anthropic::Beta::BetaSelfHostedConfigParams
              )
            )
          )
        end
        attr_accessor :config

        # Optional description of the environment
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # User-provided metadata key-value pairs
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # The visibility scope for this environment. 'organization' makes the environment
        # visible to all accounts. 'account' restricts visibility to the owning account
        # only. Only applicable for self-hosted environments. If not specified, defaults
        # based on organization type.
        sig do
          returns(
            T.nilable(Anthropic::Beta::EnvironmentCreateParams::Scope::OrSymbol)
          )
        end
        attr_accessor :scope

        # Optional header to specify the beta version(s) you want to use.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
          ).void
        end
        attr_writer :betas

        sig do
          params(
            name: String,
            config:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaCloudConfigParams::OrHash,
                  Anthropic::Beta::BetaSelfHostedConfigParams::OrHash
                )
              ),
            description: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            scope:
              T.nilable(
                Anthropic::Beta::EnvironmentCreateParams::Scope::OrSymbol
              ),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable name for the environment
          name:,
          # Environment configuration
          config: nil,
          # Optional description of the environment
          description: nil,
          # User-provided metadata key-value pairs
          metadata: nil,
          # The visibility scope for this environment. 'organization' makes the environment
          # visible to all accounts. 'account' restricts visibility to the owning account
          # only. Only applicable for self-hosted environments. If not specified, defaults
          # based on organization type.
          scope: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              config:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaCloudConfigParams,
                    Anthropic::Beta::BetaSelfHostedConfigParams
                  )
                ),
              description: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              scope:
                T.nilable(
                  Anthropic::Beta::EnvironmentCreateParams::Scope::OrSymbol
                ),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Environment configuration
        module Config
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaCloudConfigParams,
                Anthropic::Beta::BetaSelfHostedConfigParams
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::EnvironmentCreateParams::Config::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CLOUD =
              T.let(
                :cloud,
                Anthropic::Beta::EnvironmentCreateParams::Config::Type::TaggedSymbol
              )
            SELF_HOSTED =
              T.let(
                :self_hosted,
                Anthropic::Beta::EnvironmentCreateParams::Config::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::EnvironmentCreateParams::Config::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::EnvironmentCreateParams::Config::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              networking:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaUnrestrictedNetwork::OrHash,
                    Anthropic::Beta::BetaLimitedNetworkParams::OrHash
                  )
                ),
              packages: T.nilable(Anthropic::Beta::BetaPackagesParams::OrHash)
            ).returns(
              Anthropic::Beta::EnvironmentCreateParams::Config::Variants
            )
          end
          def self.new(
            type:,
            # Network configuration policy. Omit on update to preserve the existing value.
            networking: nil,
            # Specify packages (and optionally their versions) available in this environment.
            #
            # When versioning, use the version semantics relevant for the package manager,
            # e.g. for `pip` use `package==1.0.0`. You are responsible for validating the
            # package and version exist. Unversioned installs the latest.
            packages: nil
          )
          end
        end

        # The visibility scope for this environment. 'organization' makes the environment
        # visible to all accounts. 'account' restricts visibility to the owning account
        # only. Only applicable for self-hosted environments. If not specified, defaults
        # based on organization type.
        module Scope
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::EnvironmentCreateParams::Scope)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ORGANIZATION =
            T.let(
              :organization,
              Anthropic::Beta::EnvironmentCreateParams::Scope::TaggedSymbol
            )
          ACCOUNT =
            T.let(
              :account,
              Anthropic::Beta::EnvironmentCreateParams::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::EnvironmentCreateParams::Scope::TaggedSymbol
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
