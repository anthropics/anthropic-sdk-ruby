# frozen_string_literal: true

module Anthropic
  module Models
    class OutputConfig < Anthropic::Internal::Type::BaseModel
      # @!attribute effort
      #   All possible effort levels.
      #
      #   @return [Symbol, Anthropic::Models::OutputConfig::Effort, nil]
      optional :effort, enum: -> { Anthropic::OutputConfig::Effort }, nil?: true

      # @!attribute format_
      #   A schema to specify Claude's output format in responses. See
      #   [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
      #
      #   @return [Anthropic::Models::JSONOutputFormat, nil]
      optional :format_, -> { Anthropic::JSONOutputFormat }, api_name: :format, nil?: true

      # @!method initialize(effort: nil, format_: nil)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::OutputConfig} for more details.
      #
      #   @param effort [Symbol, Anthropic::Models::OutputConfig::Effort, nil] All possible effort levels.
      #
      #   @param format_ [Anthropic::Models::JSONOutputFormat, nil] A schema to specify Claude's output format in responses. See [structured outputs

      # All possible effort levels.
      #
      # @see Anthropic::Models::OutputConfig#effort
      module Effort
        extend Anthropic::Internal::Type::Enum

        LOW = :low
        MEDIUM = :medium
        HIGH = :high
        MAX = :max

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
