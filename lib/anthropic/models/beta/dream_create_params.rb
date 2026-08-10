# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Dreams#create
      class DreamCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute inputs
        #
        #   @return [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        required :inputs, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaDreamInput] }

        # @!attribute model
        #   Model identifier and configuration applied to every pipeline stage.
        #
        #   @return [String, Anthropic::Models::Beta::BetaDreamModelConfigParam]
        required :model, union: -> { Anthropic::Beta::DreamCreateParams::Model }

        # @!attribute instructions
        #
        #   @return [String, nil]
        optional :instructions, String, nil?: true

        # @!attribute output_behavior
        #   The default destination: the job creates a new output memory store as a clone of
        #   the memory_store input and writes the consolidated memories into it. The input
        #   store is never mutated.
        #
        #   @return [Anthropic::Models::Beta::DreamCreateParams::OutputBehavior::CreateNew, Anthropic::Models::Beta::DreamCreateParams::OutputBehavior::UpdateExisting, nil]
        optional :output_behavior, union: -> { Anthropic::Beta::DreamCreateParams::OutputBehavior }

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(inputs:, model:, instructions: nil, output_behavior: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::DreamCreateParams} for more details.
        #
        #   @param inputs [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>]
        #
        #   @param model [String, Anthropic::Models::Beta::BetaDreamModelConfigParam] Model identifier and configuration applied to every pipeline stage.
        #
        #   @param instructions [String, nil]
        #
        #   @param output_behavior [Anthropic::Models::Beta::DreamCreateParams::OutputBehavior::CreateNew, Anthropic::Models::Beta::DreamCreateParams::OutputBehavior::UpdateExisting] The default destination: the job creates a new output memory store as a clone of
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Model identifier and configuration applied to every pipeline stage.
        module Model
          extend Anthropic::Internal::Type::Union

          variant String

          # Model identifier and configuration applied to every pipeline stage.
          variant -> { Anthropic::Beta::BetaDreamModelConfigParam }

          # @!method self.variants
          #   @return [Array(String, Anthropic::Models::Beta::BetaDreamModelConfigParam)]
        end

        # The default destination: the job creates a new output memory store as a clone of
        # the memory_store input and writes the consolidated memories into it. The input
        # store is never mutated.
        module OutputBehavior
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The default destination: the job creates a new output memory store as a clone of the memory_store input and writes the consolidated memories into it. The input store is never mutated.
          variant :create_new, -> { Anthropic::Beta::DreamCreateParams::OutputBehavior::CreateNew }

          # The job writes the consolidated memories into this existing memory store instead of creating one. In EAP the store must be the job's own memory_store input, so the job consolidates the store in place.
          variant :update_existing, -> { Anthropic::Beta::DreamCreateParams::OutputBehavior::UpdateExisting }

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
          #   @return [Array(Anthropic::Models::Beta::DreamCreateParams::OutputBehavior::CreateNew, Anthropic::Models::Beta::DreamCreateParams::OutputBehavior::UpdateExisting)]

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
          # @return [Anthropic::Models::Beta::DreamCreateParams::OutputBehavior::CreateNew, Anthropic::Models::Beta::DreamCreateParams::OutputBehavior::UpdateExisting]
          def self.new(type:, **args)
            case type.to_sym
            when :create_new
              Anthropic::Beta::DreamCreateParams::OutputBehavior::CreateNew.new(**args)
            when :update_existing
              Anthropic::Beta::DreamCreateParams::OutputBehavior::UpdateExisting.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
