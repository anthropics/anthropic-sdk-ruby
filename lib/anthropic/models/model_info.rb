# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Models#retrieve
    class ModelInfo < Anthropic::BaseModel
      # @!attribute id
      #   Unique model identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   RFC 3339 datetime string representing the time at which the model was released.
      #     May be set to an epoch value if the release date is unknown.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute display_name
      #   A human-readable name for the model.
      #
      #   @return [String]
      required :display_name, String

      # @!attribute type
      #   Object type.
      #
      #     For Models, this is always `"model"`.
      #
      #   @return [Symbol, :model]
      required :type, const: :model

      # @!parse
      #   # @param id [String]
      #   # @param created_at [Time]
      #   # @param display_name [String]
      #   # @param type [Symbol, :model]
      #   #
      #   def initialize(id:, created_at:, display_name:, type: :model, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
