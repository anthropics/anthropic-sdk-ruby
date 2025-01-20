# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # completion => {
    #   id: String,
    #   completion: String,
    #   model: union: Anthropic::Models::Model,
    #   stop_reason: String,
    #   type: enum: Anthropic::Models::Completion::Type
    # }
    # ```
    class Completion < Anthropic::BaseModel
      # @!attribute id
      #   Unique object identifier.
      #
      # The format and length of IDs may change over time.
      #
      #   @return [String]
      required :id, String

      # @!attribute completion
      #   The resulting completion up to and excluding the stop sequences.
      #
      #   @return [String]
      required :completion, String

      # @!attribute model
      #   The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
      #
      #   @return [String, Symbol, Anthropic::Models::Model::UnionMember1]
      required :model, union: -> { Anthropic::Models::Model }

      # @!attribute stop_reason
      #   The reason that we stopped.
      #
      # This may be one the following values:
      # * `"stop_sequence"`: we reached a stop sequence — either provided by you via the `stop_sequences` parameter, or a stop sequence built into the model
      # * `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      #
      #   @return [String, nil]
      required :stop_reason, String, nil?: true

      # @!attribute type
      #   Object type.
      #
      # For Text Completions, this is always `"completion"`.
      #
      #   @return [Symbol, Anthropic::Models::Completion::Type]
      required :type, enum: -> { Anthropic::Models::Completion::Type }

      # @!parse
      #   # @param id [String] Unique object identifier.
      #   #
      #   #   The format and length of IDs may change over time.
      #   #
      #   # @param completion [String] The resulting completion up to and excluding the stop sequences.
      #   #
      #   # @param model [String] The model that will complete your prompt.\n\nSee
      #   #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   #   details and options.
      #   #
      #   # @param stop_reason [String, nil] The reason that we stopped.
      #   #
      #   #   This may be one the following values:
      #   #
      #   #   - `"stop_sequence"`: we reached a stop sequence — either provided by you via the
      #   #     `stop_sequences` parameter, or a stop sequence built into the model
      #   #   - `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      #   #
      #   # @param type [String] Object type.
      #   #
      #   #   For Text Completions, this is always `"completion"`.
      #   #
      #   def initialize(id:, completion:, model:, stop_reason:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # Object type.
      #
      # For Text Completions, this is always `"completion"`.
      #
      # @example
      # ```ruby
      # case type
      # in :completion
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        COMPLETION = :completion

        finalize!
      end
    end
  end
end
