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

        # Request params for `cloud` environment configuration.
        #
        # Fields default to null; on update, omitted fields preserve the existing value.
        sig { returns(T.nilable(Anthropic::Beta::BetaCloudConfigParams)) }
        attr_reader :config

        sig do
          params(
            config: T.nilable(Anthropic::Beta::BetaCloudConfigParams::OrHash)
          ).void
        end
        attr_writer :config

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
            config: T.nilable(Anthropic::Beta::BetaCloudConfigParams::OrHash),
            description: T.nilable(String),
            metadata: T::Hash[Symbol, T.nilable(String)],
            name: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          environment_id:,
          # Request params for `cloud` environment configuration.
          #
          # Fields default to null; on update, omitted fields preserve the existing value.
          config: nil,
          # Updated description of the environment
          description: nil,
          # User-provided metadata key-value pairs. Set a value to null or empty string to
          # delete the key.
          metadata: nil,
          # Updated name for the environment
          name: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              environment_id: String,
              config: T.nilable(Anthropic::Beta::BetaCloudConfigParams),
              description: T.nilable(String),
              metadata: T::Hash[Symbol, T.nilable(String)],
              name: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
