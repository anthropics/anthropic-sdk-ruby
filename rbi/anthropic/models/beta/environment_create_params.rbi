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

        # Optional description of the environment
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # User-provided metadata key-value pairs
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

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
            config: T.nilable(Anthropic::Beta::BetaCloudConfigParams::OrHash),
            description: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable name for the environment
          name:,
          # Request params for `cloud` environment configuration.
          #
          # Fields default to null; on update, omitted fields preserve the existing value.
          config: nil,
          # Optional description of the environment
          description: nil,
          # User-provided metadata key-value pairs
          metadata: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              config: T.nilable(Anthropic::Beta::BetaCloudConfigParams),
              description: T.nilable(String),
              metadata: T::Hash[Symbol, String],
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
