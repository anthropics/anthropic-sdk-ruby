# frozen_string_literal: true

module Anthropic
  module Models
    class Completion < Anthropic::BaseModel
      # @!attribute id
      #   Unique object identifier.
      #
      #     The format and length of IDs may change over time.
      #
      #   @return [String]
      required :id, String

      # @!attribute completion
      #   The resulting completion up to and excluding the stop sequences.
      #
      #   @return [String]
      required :completion, String

      # @!attribute model
      #   The model that will complete your prompt.\n\nSee
      #     [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #     details and options.
      #
      #   @return [Symbol, String]
      required :model, union: -> { Anthropic::Models::Model }

      # @!attribute stop_reason
      #   The reason that we stopped.
      #
      #     This may be one the following values:
      #
      #     - `"stop_sequence"`: we reached a stop sequence — either provided by you via the
      #       `stop_sequences` parameter, or a stop sequence built into the model
      #     - `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      #
      #   @return [String, nil]
      required :stop_reason, String, nil?: true

      # @!attribute type
      #   Object type.
      #
      #     For Text Completions, this is always `"completion"`.
      #
      #   @return [Symbol, :completion]
      required :type, const: :completion

      # @!parse
      #   # @param id [String]
      #   # @param completion [String]
      #   # @param model [Symbol, String]
      #   # @param stop_reason [String, nil]
      #   # @param type [Symbol, :completion]
      #   #
      #   def initialize(id:, completion:, model:, stop_reason:, type: :completion, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
