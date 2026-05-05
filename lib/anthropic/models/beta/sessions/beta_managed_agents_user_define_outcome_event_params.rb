# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserDefineOutcomeEventParams < Anthropic::Internal::Type::BaseModel
          # @!attribute description
          #   What the agent should produce. This is the task specification.
          #
          #   @return [String]
          required :description, String

          # @!attribute rubric
          #   Rubric for grading the quality of an outcome.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubricParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams]
          required :rubric,
                   union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Rubric }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type }

          # @!attribute max_iterations
          #   Eval→revision cycles before giving up. Default 3, max 20.
          #
          #   @return [Integer, nil]
          optional :max_iterations, Integer, nil?: true

          # @!method initialize(description:, rubric:, type:, max_iterations: nil)
          #   Parameters for defining an outcome the agent should work toward. The agent
          #   begins work on receipt.
          #
          #   @param description [String] What the agent should produce. This is the task specification.
          #
          #   @param rubric [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubricParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams] Rubric for grading the quality of an outcome.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type]
          #
          #   @param max_iterations [Integer, nil] Eval→revision cycles before giving up. Default 3, max 20.

          # Rubric for grading the quality of an outcome.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams#rubric
          module Rubric
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Rubric referenced by a file uploaded via the Files API.
            variant :file, -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams }

            # Rubric content provided inline as text.
            variant :text, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubricParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            USER_DEFINE_OUTCOME = :"user.define_outcome"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
