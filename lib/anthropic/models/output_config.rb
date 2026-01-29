# frozen_string_literal: true

module Anthropic
  module Models
    class OutputConfig < Anthropic::Internal::Type::BaseModel
      # @!attribute format_
      #   A schema to specify Claude's output format in responses. See
      #   [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
      #
      #   @return [Anthropic::Models::JSONOutputFormat, nil]
      optional :format_, -> { Anthropic::JSONOutputFormat }, api_name: :format, nil?: true

      # @!method initialize(format_: nil)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::OutputConfig} for more details.
      #
      #   @param format_ [Anthropic::Models::JSONOutputFormat, nil] A schema to specify Claude's output format in responses. See [structured outputs
    end
  end
end
