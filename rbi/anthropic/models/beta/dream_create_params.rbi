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

        # The memory store and sessions for the dream to read, as exactly one
        # `memory_store` entry and exactly one `sessions` entry.
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

        # The model that runs a dream, given as a model ID or as an object with `id` and
        # `speed`.
        #
        # In the object form, `speed` can only be `standard`.
        #
        # The
        # [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
        # lists the supported models.
        sig do
          returns(T.any(Anthropic::Beta::BetaDreamModelConfigParam, String))
        end
        attr_accessor :model

        # Guidance that steers how the dream reads the sessions and organizes the output
        # memory store, from 1 to 4,096 characters.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#steer-with-instructions)
        # for what kinds of instructions work well.
        sig { returns(T.nilable(String)) }
        attr_accessor :instructions

        # Which memory store a dream writes its result to. Defaults to `create_new` when
        # left out of a create request.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaOutputBehaviorCreateNew,
                Anthropic::Beta::BetaOutputBehaviorUpdateExisting
              )
            )
          )
        end
        attr_reader :output_behavior

        sig do
          params(
            output_behavior:
              T.any(
                Anthropic::Beta::BetaOutputBehaviorCreateNew::OrHash,
                Anthropic::Beta::BetaOutputBehaviorUpdateExisting::OrHash
              )
          ).void
        end
        attr_writer :output_behavior

        # This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
        # header.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
          ).void
        end
        attr_writer :betas

        # Optional header to select the Workspace for this request. The value is a
        # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        # Only needed for credentials that can act on more than one Workspace. A
        # credential that belongs to a specific Workspace may omit it; if sent, it must
        # match that Workspace.
        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

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
              T.any(Anthropic::Beta::BetaDreamModelConfigParam::OrHash, String),
            instructions: T.nilable(String),
            output_behavior:
              T.any(
                Anthropic::Beta::BetaOutputBehaviorCreateNew::OrHash,
                Anthropic::Beta::BetaOutputBehaviorUpdateExisting::OrHash
              ),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The memory store and sessions for the dream to read, as exactly one
          # `memory_store` entry and exactly one `sessions` entry.
          inputs:,
          # The model that runs a dream, given as a model ID or as an object with `id` and
          # `speed`.
          #
          # In the object form, `speed` can only be `standard`.
          #
          # The
          # [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
          # lists the supported models.
          model:,
          # Guidance that steers how the dream reads the sessions and organizes the output
          # memory store, from 1 to 4,096 characters.
          #
          # See the
          # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#steer-with-instructions)
          # for what kinds of instructions work well.
          instructions: nil,
          # Which memory store a dream writes its result to. Defaults to `create_new` when
          # left out of a create request.
          output_behavior: nil,
          # This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
          # header.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
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
              model: T.any(Anthropic::Beta::BetaDreamModelConfigParam, String),
              instructions: T.nilable(String),
              output_behavior:
                T.any(
                  Anthropic::Beta::BetaOutputBehaviorCreateNew,
                  Anthropic::Beta::BetaOutputBehaviorUpdateExisting
                ),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The model that runs a dream, given as a model ID or as an object with `id` and
        # `speed`.
        #
        # In the object form, `speed` can only be `standard`.
        #
        # The
        # [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
        # lists the supported models.
        module Model
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(Anthropic::Beta::BetaDreamModelConfigParam, String)
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
