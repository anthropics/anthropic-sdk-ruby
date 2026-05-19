# typed: strong

module Anthropic
  module Models
    module Beta
      class EnvironmentUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::EnvironmentUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :environment_id

        # Updated environment configuration
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

        # Updated description of the environment
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # User-provided metadata key-value pairs. Set a value to null or empty string to
        # delete the key.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, T.nilable(String)]).void }
        attr_writer :metadata

        # Updated name for the environment
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The visibility scope for this environment. 'organization' makes the environment
        # visible to all accounts. 'account' restricts visibility to the owning account
        # only.
        sig do
          returns(
            T.nilable(Anthropic::Beta::EnvironmentUpdateParams::Scope::OrSymbol)
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
            environment_id: String,
            config:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaCloudConfigParams::OrHash,
                  Anthropic::Beta::BetaSelfHostedConfigParams::OrHash
                )
              ),
            description: T.nilable(String),
            metadata: T::Hash[Symbol, T.nilable(String)],
            name: T.nilable(String),
            scope:
              T.nilable(
                Anthropic::Beta::EnvironmentUpdateParams::Scope::OrSymbol
              ),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          environment_id:,
          # Updated environment configuration
          config: nil,
          # Updated description of the environment
          description: nil,
          # User-provided metadata key-value pairs. Set a value to null or empty string to
          # delete the key.
          metadata: nil,
          # Updated name for the environment
          name: nil,
          # The visibility scope for this environment. 'organization' makes the environment
          # visible to all accounts. 'account' restricts visibility to the owning account
          # only.
          scope: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              environment_id: String,
              config:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaCloudConfigParams,
                    Anthropic::Beta::BetaSelfHostedConfigParams
                  )
                ),
              description: T.nilable(String),
              metadata: T::Hash[Symbol, T.nilable(String)],
              name: T.nilable(String),
              scope:
                T.nilable(
                  Anthropic::Beta::EnvironmentUpdateParams::Scope::OrSymbol
                ),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Updated environment configuration
        module Config
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaCloudConfigParams,
                Anthropic::Beta::BetaSelfHostedConfigParams
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::EnvironmentUpdateParams::Config::Variants
              ]
            )
          end
          def self.variants
          end
        end

        # The visibility scope for this environment. 'organization' makes the environment
        # visible to all accounts. 'account' restricts visibility to the owning account
        # only.
        module Scope
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::EnvironmentUpdateParams::Scope)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ORGANIZATION =
            T.let(
              :organization,
              Anthropic::Beta::EnvironmentUpdateParams::Scope::TaggedSymbol
            )
          ACCOUNT =
            T.let(
              :account,
              Anthropic::Beta::EnvironmentUpdateParams::Scope::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::EnvironmentUpdateParams::Scope::TaggedSymbol
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
