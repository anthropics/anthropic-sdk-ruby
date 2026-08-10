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

        # @!attribute output_behavior
        #   The default destination: the job creates a new output memory store as a clone of
        #   the memory_store input and writes the consolidated memories into it. The input
        #   store is never mutated.
        #
        #   @return [Anthropic::Models::Beta::BetaDream::OutputBehavior::CreateNew, Anthropic::Models::Beta::BetaDream::OutputBehavior::UpdateExisting]
        required :output_behavior, union: -> { Anthropic::Beta::BetaDream::OutputBehavior }

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

        # @!method initialize(id:, archived_at:, created_at:, ended_at:, error:, inputs:, instructions:, model:, output_behavior:, outputs:, session_id:, status:, type:, usage:)
        #   An asynchronous memory-consolidation job that reads a memory store plus a set of
        #   session transcripts and writes consolidated memories into an output memory store
        #   — a new store by default, or an existing store chosen via output_behavior. The
        #   Dreams API is in research preview: the request and response shapes are volatile
        #   and may change without the deprecation period that applies to
        #   generally-available endpoints.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDream} for more details.
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
        #   @param output_behavior [Anthropic::Models::Beta::BetaDream::OutputBehavior::CreateNew, Anthropic::Models::Beta::BetaDream::OutputBehavior::UpdateExisting] The default destination: the job creates a new output memory store as a clone of
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

        # The default destination: the job creates a new output memory store as a clone of
        # the memory_store input and writes the consolidated memories into it. The input
        # store is never mutated.
        #
        # @see Anthropic::Models::Beta::BetaDream#output_behavior
        module OutputBehavior
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The default destination: the job creates a new output memory store as a clone of the memory_store input and writes the consolidated memories into it. The input store is never mutated.
          variant :create_new, -> { Anthropic::Beta::BetaDream::OutputBehavior::CreateNew }

          # The job writes the consolidated memories into this existing memory store instead of creating one. In EAP the store must be the job's own memory_store input, so the job consolidates the store in place.
          variant :update_existing, -> { Anthropic::Beta::BetaDream::OutputBehavior::UpdateExisting }

          class CreateNew < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :create_new]
            required :type, const: :create_new

            # @!method initialize(type: :create_new)
            #   The default destination: the job creates a new output memory store as a clone of
            #   the memory_store input and writes the consolidated memories into it. The input
            #   store is never mutated.
            #
            #   @param type [Symbol, :create_new]
          end

          class UpdateExisting < Anthropic::Internal::Type::BaseModel
            # @!attribute memory_store_id
            #
            #   @return [String]
            required :memory_store_id, String

            # @!attribute type
            #
            #   @return [Symbol, :update_existing]
            required :type, const: :update_existing

            # @!method initialize(memory_store_id:, type: :update_existing)
            #   The job writes the consolidated memories into this existing memory store instead
            #   of creating one. In EAP the store must be the job's own memory_store input, so
            #   the job consolidates the store in place.
            #
            #   @param memory_store_id [String]
            #   @param type [Symbol, :update_existing]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaDream::OutputBehavior::CreateNew, Anthropic::Models::Beta::BetaDream::OutputBehavior::UpdateExisting)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :memory_store_id
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaDream::OutputBehavior::CreateNew, Anthropic::Models::Beta::BetaDream::OutputBehavior::UpdateExisting]
          def self.new(type:, **args)
            case type.to_sym
            when :create_new
              Anthropic::Beta::BetaDream::OutputBehavior::CreateNew.new(**args)
            when :update_existing
              Anthropic::Beta::BetaDream::OutputBehavior::UpdateExisting.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

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
