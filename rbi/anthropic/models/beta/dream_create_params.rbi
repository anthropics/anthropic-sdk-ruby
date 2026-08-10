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

        # The default destination: the job creates a new output memory store as a clone of
        # the memory_store input and writes the consolidated memories into it. The input
        # store is never mutated.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::DreamCreateParams::OutputBehavior::CreateNew,
                Anthropic::Beta::DreamCreateParams::OutputBehavior::UpdateExisting
              )
            )
          )
        end
        attr_reader :output_behavior

        sig do
          params(
            output_behavior:
              T.any(
                Anthropic::Beta::DreamCreateParams::OutputBehavior::CreateNew::OrHash,
                Anthropic::Beta::DreamCreateParams::OutputBehavior::UpdateExisting::OrHash
              )
          ).void
        end
        attr_writer :output_behavior

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
            output_behavior:
              T.any(
                Anthropic::Beta::DreamCreateParams::OutputBehavior::CreateNew::OrHash,
                Anthropic::Beta::DreamCreateParams::OutputBehavior::UpdateExisting::OrHash
              ),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          inputs:,
          # Model identifier and configuration applied to every pipeline stage.
          model:,
          instructions: nil,
          # The default destination: the job creates a new output memory store as a clone of
          # the memory_store input and writes the consolidated memories into it. The input
          # store is never mutated.
          output_behavior: nil,
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
              output_behavior:
                T.any(
                  Anthropic::Beta::DreamCreateParams::OutputBehavior::CreateNew,
                  Anthropic::Beta::DreamCreateParams::OutputBehavior::UpdateExisting
                ),
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

        # The default destination: the job creates a new output memory store as a clone of
        # the memory_store input and writes the consolidated memories into it. The input
        # store is never mutated.
        module OutputBehavior
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::DreamCreateParams::OutputBehavior::CreateNew,
                Anthropic::Beta::DreamCreateParams::OutputBehavior::UpdateExisting
              )
            end

          class CreateNew < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::DreamCreateParams::OutputBehavior::CreateNew,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # The default destination: the job creates a new output memory store as a clone of
            # the memory_store input and writes the consolidated memories into it. The input
            # store is never mutated.
            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(type: :create_new)
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end

          class UpdateExisting < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::DreamCreateParams::OutputBehavior::UpdateExisting,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :memory_store_id

            sig { returns(Symbol) }
            attr_accessor :type

            # The job writes the consolidated memories into this existing memory store instead
            # of creating one. In EAP the store must be the job's own memory_store input, so
            # the job consolidates the store in place.
            sig do
              params(memory_store_id: String, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(memory_store_id:, type: :update_existing)
            end

            sig { override.returns({ memory_store_id: String, type: Symbol }) }
            def to_hash
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::DreamCreateParams::OutputBehavior::Variants
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
              memory_store_id: String
            ).returns(
              Anthropic::Beta::DreamCreateParams::OutputBehavior::Variants
            )
          end
          def self.new(type:, memory_store_id: nil)
          end
        end
      end
    end
  end
end
