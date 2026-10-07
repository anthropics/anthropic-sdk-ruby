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
      #   Object mapping capability names to their support details. Keys are always
      #   present for all known capabilities.
      #
      #   @return [Anthropic::Models::ModelCapabilities, nil]
      required :capabilities, -> { Anthropic::ModelCapabilities }, nil?: true

      # @!attribute created_at
      #   RFC 3339 datetime string representing the time at which the model was released.
      #   May be set to an epoch value if the release date is unknown.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute deprecated_at
      #   RFC 3339 datetime string representing the time of the model's most recent
      #   deprecation. Populated for `deprecated` and `retired` models; `null` while the
      #   model is `active`.
      #
      #   @return [Time, nil]
      required :deprecated_at, Time, nil?: true

      # @!attribute display_name
      #   A human-readable name for the model.
      #
      #   @return [String]
      required :display_name, String

      # @!attribute lifecycle
      #   The model's current lifecycle stage.
      #
      #   - `active`: The model is available for use, open to new adopters, and not
      #     scheduled for retirement.
      #   - `deprecated`: The model remains callable for organizations with existing
      #     access, but is headed for retirement and closed to new adopters.
      #   - `retired`: The model is no longer available for use; inference requests naming
      #     it fail. It remains in the catalogue as the historical record of its
      #     retirement.
      #
      #   @return [Symbol, Anthropic::Models::ModelInfo::Lifecycle]
      required :lifecycle, enum: -> { Anthropic::ModelInfo::Lifecycle }

      # @!attribute line
      #   The model line this model belongs to, such as `opus` for both Claude Opus 4.5
      #   and Claude Opus 4.6. More lines may be added. `null` when the model belongs to
      #   no line; do not infer a line from the `id`.
      #
      #   @return [Symbol, Anthropic::Models::ModelLine, nil]
      required :line, enum: -> { Anthropic::ModelLine }, nil?: true

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

      # @!attribute retires_at
      #   RFC 3339 datetime string representing the model's currently scheduled retirement
      #   date. The schedule can be revised until retirement occurs; `null` while the
      #   model is `active` or while no retirement is scheduled. A past date on a
      #   `deprecated` model means retirement is overdue, not that it has occurred:
      #   `lifecycle` is the retirement signal.
      #
      #   @return [Time, nil]
      required :retires_at, Time, nil?: true

      # @!attribute type
      #   Object type.
      #
      #   For Models, this is always `"model"`.
      #
      #   @return [Symbol, :model]
      required :type, const: :model

      # @!method initialize(id:, capabilities:, created_at:, deprecated_at:, display_name:, lifecycle:, line:, max_input_tokens:, max_tokens:, retires_at:, type: :model)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ModelInfo} for more details.
      #
      #   @param id [String] Unique model identifier.
      #
      #   @param capabilities [Anthropic::Models::ModelCapabilities, nil] Object mapping capability names to their support details. Keys are always presen
      #
      #   @param created_at [Time] RFC 3339 datetime string representing the time at which the model was released.
      #
      #   @param deprecated_at [Time, nil] RFC 3339 datetime string representing the time of the model's most recent deprec
      #
      #   @param display_name [String] A human-readable name for the model.
      #
      #   @param lifecycle [Symbol, Anthropic::Models::ModelInfo::Lifecycle] The model's current lifecycle stage.
      #
      #   @param line [Symbol, Anthropic::Models::ModelLine, nil] The model line this model belongs to, such as `opus` for both Claude Opus 4.5 an
      #
      #   @param max_input_tokens [Integer, nil] Maximum input context window size in tokens for this model.
      #
      #   @param max_tokens [Integer, nil] Maximum value for the `max_tokens` parameter when using this model.
      #
      #   @param retires_at [Time, nil] RFC 3339 datetime string representing the model's currently scheduled retirement
      #
      #   @param type [Symbol, :model] Object type.

      # The model's current lifecycle stage.
      #
      # - `active`: The model is available for use, open to new adopters, and not
      #   scheduled for retirement.
      # - `deprecated`: The model remains callable for organizations with existing
      #   access, but is headed for retirement and closed to new adopters.
      # - `retired`: The model is no longer available for use; inference requests naming
      #   it fail. It remains in the catalogue as the historical record of its
      #   retirement.
      #
      # @see Anthropic::Models::ModelInfo#lifecycle
      module Lifecycle
        extend Anthropic::Internal::Type::Enum

        ACTIVE = :active
        DEPRECATED = :deprecated
        RETIRED = :retired

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
