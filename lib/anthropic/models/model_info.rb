# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # model_info => {
    #   id: String,
    #   created_at: Time,
    #   display_name: String,
    #   type: Anthropic::Models::ModelInfo::Type
    # }
    # ```
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
      #   @return [Symbol, Anthropic::Models::ModelInfo::Type]
      required :type, enum: -> { Anthropic::Models::ModelInfo::Type }

      # @!parse
      #   # @param id [String]
      #   # @param created_at [String]
      #   # @param display_name [String]
      #   # @param type [String]
      #   #
      #   def initialize(id:, created_at:, display_name:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # Object type.
      #
      #   For Models, this is always `"model"`.
      #
      # @example
      # ```ruby
      # case type
      # in :model
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        MODEL = :model

        finalize!
      end
    end
  end
end
