# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Models#retrieve
    class ModelInfo < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   Unique model identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute capabilities
      #   Model capability information.
      #
      #   @return [Anthropic::Models::ModelCapabilities, nil]
      required :capabilities, -> { Anthropic::ModelCapabilities }, nil?: true

      # @!attribute created_at
      #   RFC 3339 datetime string representing the time at which the model was released.
      #   May be set to an epoch value if the release date is unknown.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute display_name
      #   A human-readable name for the model.
      #
      #   @return [String]
      required :display_name, String

      # @!attribute max_input_tokens
      #   Maximum input context window size in tokens for this model.
      #
      #   @return [Integer, nil]
      required :max_input_tokens, Integer, nil?: true

      # @!attribute max_tokens
      #   Maximum value for the `max_tokens` parameter when using this model.
      #
      #   @return [Integer, nil]
      required :max_tokens, Integer, nil?: true

      # @!attribute type
      #   Object type.
      #
      #   For Models, this is always `"model"`.
      #
      #   @return [Symbol, :model]
      required :type, const: :model

      # @!method initialize(id:, capabilities:, created_at:, display_name:, max_input_tokens:, max_tokens:, type: :model)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ModelInfo} for more details.
      #
      #   @param id [String] Unique model identifier.
      #
      #   @param capabilities [Anthropic::Models::ModelCapabilities, nil] Model capability information.
      #
      #   @param created_at [Time] RFC 3339 datetime string representing the time at which the model was released.
      #
      #   @param display_name [String] A human-readable name for the model.
      #
      #   @param max_input_tokens [Integer, nil] Maximum input context window size in tokens for this model.
      #
      #   @param max_tokens [Integer, nil] Maximum value for the `max_tokens` parameter when using this model.
      #
      #   @param type [Symbol, :model] Object type.
    end
  end
end
