# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaOutputConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute effort
        #   How much effort the model should put into its response. Higher effort levels may
        #   result in more thorough analysis but take longer.
        #
        #   Valid values are `low`, `medium`, `high`, `xhigh`, or `max`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaOutputConfig::Effort, nil]
        optional :effort, enum: -> { Anthropic::Beta::BetaOutputConfig::Effort }, nil?: true

        # @!attribute format_
        #   A schema to specify Claude's output format in responses. See
        #   [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
        #
        #   @return [Anthropic::Models::Beta::BetaJSONOutputFormat, nil]
        optional :format_, -> { Anthropic::Beta::BetaJSONOutputFormat }, api_name: :format, nil?: true

        # @!attribute task_budget
        #   Configuration for token budget tracking across contexts.
        #
        #   @return [Anthropic::Models::Beta::BetaTokenTaskBudget, nil]
        optional :task_budget, -> { Anthropic::Beta::BetaTokenTaskBudget }, nil?: true

        # @!method initialize(effort: nil, format_: nil, task_budget: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaOutputConfig} for more details.
        #
        #   @param effort [Symbol, Anthropic::Models::Beta::BetaOutputConfig::Effort, nil] How much effort the model should put into its response. Higher effort levels may
        #
        #   @param format_ [Anthropic::Models::Beta::BetaJSONOutputFormat, nil] A schema to specify Claude's output format in responses. See [structured outputs
        #
        #   @param task_budget [Anthropic::Models::Beta::BetaTokenTaskBudget, nil] Configuration for token budget tracking across contexts.

        # How much effort the model should put into its response. Higher effort levels may
        # result in more thorough analysis but take longer.
        #
        # Valid values are `low`, `medium`, `high`, `xhigh`, or `max`.
        #
        # @see Anthropic::Models::Beta::BetaOutputConfig#effort
        module Effort
          extend Anthropic::Internal::Type::Enum

          LOW = :low
          MEDIUM = :medium
          HIGH = :high
          XHIGH = :xhigh
          MAX = :max

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaOutputConfig = Beta::BetaOutputConfig
  end
end
