# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Dreams#create
      class BetaDream < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute ended_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        required :ended_at, Time, nil?: true

        # @!attribute error
        #   Failure detail for a Dream whose `status` is `failed`.
        #
        #   @return [Anthropic::Models::Beta::BetaDreamError, nil]
        required :error, -> { Anthropic::Beta::BetaDreamError }, nil?: true

        # @!attribute inputs
        #
        #   @return [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        required :inputs, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput] }

        # @!attribute instructions
        #
        #   @return [String, nil]
        required :instructions, String, nil?: true

        # @!attribute model
        #   Model identifier and configuration applied to every pipeline stage. Same wire
        #   shape as the Agents API ModelConfig.
        #
        #   @return [Anthropic::Models::Beta::BetaDreamModelConfig]
        required :model, -> { Anthropic::Beta::BetaDreamModelConfig }

        # @!attribute outputs
        #
        #   @return [Array<Anthropic::Models::Beta::BetaDreamOutput>]
        required :outputs, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaDreamOutput] }

        # @!attribute session_id
        #
        #   @return [String, nil]
        required :session_id, String, nil?: true

        # @!attribute status
        #   Lifecycle status of a Dream.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDreamStatus]
        required :status, enum: -> { Anthropic::Beta::BetaDreamStatus }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDream::Type]
        required :type, enum: -> { Anthropic::Beta::BetaDream::Type }

        # @!attribute usage
        #   Cumulative token usage for the dream across every pipeline stage.
        #
        #   @return [Anthropic::Models::Beta::BetaDreamUsage]
        required :usage, -> { Anthropic::Beta::BetaDreamUsage }

        # @!method initialize(id:, archived_at:, created_at:, ended_at:, error:, inputs:, instructions:, model:, outputs:, session_id:, status:, type:, usage:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDream} for more details.
        #
        #   An asynchronous memory-consolidation job that reads a memory store plus a set of
        #   session transcripts and writes consolidated memories into a new output memory
        #   store. The Dreams API is in research preview: the request and response shapes
        #   are volatile and may change without the deprecation period that applies to
        #   generally-available endpoints.
        #
        #   @param id [String]
        #
        #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param ended_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param error [Anthropic::Models::Beta::BetaDreamError, nil] Failure detail for a Dream whose `status` is `failed`.
        #
        #   @param inputs [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        #
        #   @param instructions [String, nil]
        #
        #   @param model [Anthropic::Models::Beta::BetaDreamModelConfig] Model identifier and configuration applied to every pipeline stage. Same wire sh
        #
        #   @param outputs [Array<Anthropic::Models::Beta::BetaDreamOutput>]
        #
        #   @param session_id [String, nil]
        #
        #   @param status [Symbol, Anthropic::Models::Beta::BetaDreamStatus] Lifecycle status of a Dream.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaDream::Type]
        #
        #   @param usage [Anthropic::Models::Beta::BetaDreamUsage] Cumulative token usage for the dream across every pipeline stage.

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
