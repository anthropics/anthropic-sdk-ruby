# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsDeploymentUserDefineOutcomeEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute description
        #   What the agent should produce. This is the task specification.
        #
        #   @return [String]
        required :description, String

        # @!attribute rubric
        #   Rubric for grading the quality of an outcome.
        #
        #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric]
        required :rubric, union: -> { Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Rubric }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type }

        # @!attribute max_iterations
        #   Eval→revision cycles before giving up. Default 3, max 20.
        #
        #   @return [Integer, nil]
        optional :max_iterations, Integer, nil?: true

        # @!method initialize(description:, rubric:, type:, max_iterations: nil)
        #   An outcome the agent should work toward. The agent begins work on receipt.
        #
        #   @param description [String] What the agent should produce. This is the task specification.
        #
        #   @param rubric [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric] Rubric for grading the quality of an outcome.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type]
        #
        #   @param max_iterations [Integer, nil] Eval→revision cycles before giving up. Default 3, max 20.

        # Rubric for grading the quality of an outcome.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent#rubric
        module Rubric
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Rubric referenced by a file uploaded via the Files API.
          variant :file, -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric }

          # Rubric content provided inline as text.
          variant :text, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric }

          module Type
            extend Anthropic::Internal::Type::Enum

            FILE = :file
            TEXT = :text

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :file_id ID of the rubric file.
          #
          #   @option args [String] :content Rubric content. Plain text or markdown — the grader treats it as freeform text.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric]
          def self.new(type:, **args)
            case type.to_sym
            when :file
              Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric.new(**args)
            when :text
              Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          USER_DEFINE_OUTCOME = :"user.define_outcome"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeploymentUserDefineOutcomeEvent =
      Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent
  end
end
