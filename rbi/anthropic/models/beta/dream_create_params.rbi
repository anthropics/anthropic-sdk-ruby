# typed: strong

module Anthropic
  module Models
    module Beta
      class DreamCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::DreamCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              T.any(
                Anthropic::Beta::BetaDreamMemoryStoreInput,
                Anthropic::Beta::BetaDreamSessionsInput
              )
            ]
          )
        end
        attr_accessor :inputs

        # Model identifier and configuration applied to every pipeline stage.
        sig do
          returns(T.any(String, Anthropic::Beta::BetaDreamModelConfigParam))
        end
        attr_accessor :model

        sig { returns(T.nilable(String)) }
        attr_accessor :instructions

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
            inputs:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaDreamMemoryStoreInput::OrHash,
                  Anthropic::Beta::BetaDreamSessionsInput::OrHash
                )
              ],
            model:
              T.any(String, Anthropic::Beta::BetaDreamModelConfigParam::OrHash),
            instructions: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          inputs:,
          # Model identifier and configuration applied to every pipeline stage.
          model:,
          instructions: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              inputs:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaDreamMemoryStoreInput,
                    Anthropic::Beta::BetaDreamSessionsInput
                  )
                ],
              model: T.any(String, Anthropic::Beta::BetaDreamModelConfigParam),
              instructions: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Model identifier and configuration applied to every pipeline stage.
        module Model
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(String, Anthropic::Beta::BetaDreamModelConfigParam)
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::DreamCreateParams::Model::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
