# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Dreams#create
      class DreamCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute inputs
        #   The memory store and sessions for the dream to read, as exactly one
        #   `memory_store` entry and exactly one `sessions` entry.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        required :inputs, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput] }

        # @!attribute model
        #   The model that runs a dream, given as a model ID or as an object with `id` and
        #   `speed`.
        #
        #   In the object form, `speed` can only be `standard`.
        #
        #   The
        #   [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
        #   lists the supported models.
        #
        #   @return [Anthropic::Models::Beta::BetaDreamModelConfigParam, String]
        required :model, union: -> { Anthropic::Beta::DreamCreateParams::Model }

        # @!attribute instructions
        #   Guidance that steers how the dream reads the sessions and organizes the output
        #   memory store, from 1 to 4,096 characters.
        #
        #   See the
        #   [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#steer-with-instructions)
        #   for what kinds of instructions work well.
        #
        #   @return [String, nil]
        optional :instructions, String, nil?: true

        # @!attribute output_behavior
        #   Which memory store a dream writes its result to. Defaults to `create_new` when
        #   left out of a create request.
        #
        #   @return [Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting, nil]
        optional :output_behavior, union: -> { Anthropic::Beta::BetaOutputBehavior }

        # @!attribute betas
        #   This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
        #   header.
        #
        #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!attribute workspace_id
        #   Optional header to select the Workspace for this request. The value is a
        #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        #   Only needed for credentials that can act on more than one Workspace. A
        #   credential that belongs to a specific Workspace may omit it; if sent, it must
        #   match that Workspace.
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!method initialize(inputs:, model:, instructions: nil, output_behavior: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::DreamCreateParams} for more details.
        #
        #   @param inputs [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>] The memory store and sessions for the dream to read, as exactly one `memory_stor
        #
        #   @param model [Anthropic::Models::Beta::BetaDreamModelConfigParam, String] The model that runs a dream, given as a model ID or as an object with `id` and `
        #
        #   @param instructions [String, nil] Guidance that steers how the dream reads the sessions and organizes the output m
        #
        #   @param output_behavior [Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting] Which memory store a dream writes its result to. Defaults to `create_new` when l
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `dreaming-2026-04-21` in this heade
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

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

          # The object form of `model` in a request to create a dream.
          variant -> { Anthropic::Beta::BetaDreamModelConfigParam }

          variant String

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaDreamModelConfigParam, String)]
        end
      end
    end
  end
end
