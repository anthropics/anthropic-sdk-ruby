# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Dreams#create
      class BetaDream < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The unique ID of the dream (`drm_...`).
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   When the dream was archived, in RFC 3339, or `null` if it hasn't been archived.
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   When the dream was created, in RFC 3339.
        #
        #   Lists of dreams are sorted by this time, newest first.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute ended_at
        #   When the dream reached `completed`, `failed`, or `canceled`, in RFC 3339, or
        #   `null` if it is still `pending` or `running`.
        #
        #   @return [Time, nil]
        required :ended_at, Time, nil?: true

        # @!attribute error
        #   Why the dream failed, or `null` if `status` isn't `failed`.
        #
        #   @return [Anthropic::Models::Beta::BetaDreamError, nil]
        required :error, -> { Anthropic::Beta::BetaDreamError }, nil?: true

        # @!attribute inputs
        #   The sources that the dream reads, from the request that created it.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        required :inputs, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput] }

        # @!attribute instructions
        #   The guidance given when the dream was created, or `null` if none was given.
        #
        #   @return [String, nil]
        required :instructions, String, nil?: true

        # @!attribute model
        #   The model that runs a dream, from the request that created it.
        #
        #   The dream uses this model for all of its work. The response always gives the
        #   model as an object, even if the request gave only a model ID.
        #
        #   @return [Anthropic::Models::Beta::BetaDreamModelConfig]
        required :model, -> { Anthropic::Beta::BetaDreamModelConfig }

        # @!attribute output_behavior
        #   Where the dream writes its result, as set in the request that created the dream.
        #   If that request left out `output_behavior`, the dream used the `create_new`
        #   behavior.
        #
        #   @return [Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting]
        required :output_behavior, union: -> { Anthropic::Beta::BetaOutputBehavior }

        # @!attribute outputs
        #   The memory store that holds the dream's result, as a one-item array, or an empty
        #   array until the dream records that memory store.
        #
        #   The array is empty while the dream is `pending` and for a short time after it
        #   starts `running`. It can stay empty if the dream fails or is canceled before
        #   then. The memory store holds the complete result only once `status` is
        #   `completed`.
        #
        #   See the
        #   [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#use-the-output)
        #   for how to review and use the result.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaDreamOutput>]
        required :outputs, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaDreamOutput] }

        # @!attribute session_id
        #   The ID of the session that runs the dream (`sesn_...`), or `null` if that
        #   session hasn't started.
        #
        #   Stream that session's events to follow what the dream reads and writes.
        #
        #   See the
        #   [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#watch-the-pipeline-run)
        #   for how to watch a running dream.
        #
        #   @return [String, nil]
        required :session_id, String, nil?: true

        # @!attribute status
        #   Where a dream is in its lifecycle.
        #
        #   `completed`, `failed`, and `canceled` are final: once a dream has one of these
        #   statuses, its status doesn't change again.
        #
        #   See the
        #   [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#lifecycle)
        #   for what each status means.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDreamStatus]
        required :status, enum: -> { Anthropic::Beta::BetaDreamStatus }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDream::Type]
        required :type, enum: -> { Anthropic::Beta::BetaDream::Type }

        # @!attribute usage
        #   The dream's token counts, which stop changing once its `status` is `completed`
        #   or `failed`. After a cancel, they can keep changing.
        #
        #   @return [Anthropic::Models::Beta::BetaDreamUsage]
        required :usage, -> { Anthropic::Beta::BetaDreamUsage }

        # @!method initialize(id:, archived_at:, created_at:, ended_at:, error:, inputs:, instructions:, model:, output_behavior:, outputs:, session_id:, status:, type:, usage:)
        #   An asynchronous job that reads a memory store and past sessions, then writes a
        #   reorganized version of that memory store.
        #
        #   By default the dream writes its result to a new memory store and doesn't change
        #   the input memory store. With `output_behavior` set to `update_existing`, it
        #   writes its result into the input memory store instead.
        #
        #   The Dreams API is in research preview: the request and response shapes are
        #   volatile and may change without the deprecation period that applies to
        #   generally-available endpoints.
        #
        #   See the
        #   [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#how-it-works)
        #   for what a dream reads and produces.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDream} for more details.
        #
        #   @param id [String] The unique ID of the dream (`drm_...`).
        #
        #   @param archived_at [Time, nil] When the dream was archived, in RFC 3339, or `null` if it hasn't been archived.
        #
        #   @param created_at [Time] When the dream was created, in RFC 3339.
        #
        #   @param ended_at [Time, nil] When the dream reached `completed`, `failed`, or `canceled`, in RFC 3339, or `nu
        #
        #   @param error [Anthropic::Models::Beta::BetaDreamError, nil] Why the dream failed, or `null` if `status` isn't `failed`.
        #
        #   @param inputs [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>] The sources that the dream reads, from the request that created it.
        #
        #   @param instructions [String, nil] The guidance given when the dream was created, or `null` if none was given.
        #
        #   @param model [Anthropic::Models::Beta::BetaDreamModelConfig] The model that runs a dream, from the request that created it.
        #
        #   @param output_behavior [Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting] Where the dream writes its result, as set in the request that created the dream.
        #
        #   @param outputs [Array<Anthropic::Models::Beta::BetaDreamOutput>] The memory store that holds the dream's result, as a one-item array, or an empty
        #
        #   @param session_id [String, nil] The ID of the session that runs the dream (`sesn_...`), or `null` if that sessio
        #
        #   @param status [Symbol, Anthropic::Models::Beta::BetaDreamStatus] Where a dream is in its lifecycle.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaDream::Type]
        #
        #   @param usage [Anthropic::Models::Beta::BetaDreamUsage] The dream's token counts, which stop changing once its `status` is `completed` o

        # @see Anthropic::Models::Beta::BetaDream#type
        module Type
          extend Anthropic::Internal::Type::Enum

          DREAM = :dream

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaDream = Beta::BetaDream
  end
end
