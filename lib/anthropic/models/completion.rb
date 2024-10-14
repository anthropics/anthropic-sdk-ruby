# frozen_string_literal: true

module Anthropic
  module Models
    class Completion < BaseModel
      # @!attribute [rw] id
      #   Unique object identifier.
      #
      # The format and length of IDs may change over time.
      #   @return [String]
      required :id, String

      # @!attribute [rw] completion
      #   The resulting completion up to and excluding the stop sequences.
      #   @return [String]
      required :completion, String

      # @!attribute [rw] model
      #   The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
      #   @return [String, Symbol, Anthropic::Models::Model::UnnamedTypeWithunionParent0]
      required :model, Anthropic::Unknown

      # @!attribute [rw] stop_reason
      #   The reason that we stopped.
      #
      # This may be one the following values:
      # * `"stop_sequence"`: we reached a stop sequence — either provided by you via the `stop_sequences` parameter, or a stop sequence built into the model
      # * `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      #   @return [String]
      required :stop_reason, String

      # @!attribute [rw] type
      #   Object type.
      #
      # For Text Completions, this is always `"completion"`.
      #   @return [Symbol, Anthropic::Models::Completion::Type]
      required :type, enum: -> { Anthropic::Models::Completion::Type }

      # Object type.
      #
      # For Text Completions, this is always `"completion"`.
      class Type < Anthropic::Enum
        COMPLETION = :completion
      end

      # Create a new instance of Completion from a Hash of raw data.
      #
      # @overload initialize(id: nil, completion: nil, model: nil, stop_reason: nil, type: nil)
      # @param id [String] Unique object identifier.
      #
      #   The format and length of IDs may change over time.
      # @param completion [String] The resulting completion up to and excluding the stop sequences.
      # @param model [String] The model that will complete your prompt.\n\nSee
      #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      # @param stop_reason [String] The reason that we stopped.
      #
      #   This may be one the following values:
      #
      #   - `"stop_sequence"`: we reached a stop sequence — either provided by you via the
      #     `stop_sequences` parameter, or a stop sequence built into the model
      #   - `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      # @param type [String] Object type.
      #
      #   For Text Completions, this is always `"completion"`.
      def initialize(data = {})
        super
      end
    end
  end
end
