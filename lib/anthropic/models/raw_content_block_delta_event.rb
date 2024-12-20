# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < Anthropic::BaseModel
      # @!attribute delta
      #
      #   @return [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta]
      required :delta, union: -> { Anthropic::Models::RawContentBlockDeltaEvent::Delta }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::RawContentBlockDeltaEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawContentBlockDeltaEvent::Type }

      # @!parse
      #   # @param delta [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta]
      #   # @param index [Integer]
      #   # @param type [String]
      #   #
      #   def initialize(delta:, index:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case union
      # in Anthropic::Models::TextDelta
      #   # ...
      # in Anthropic::Models::InputJSONDelta
      #   # ...
      # end
      # ```
      class Delta < Anthropic::Union
        variant -> { Anthropic::Models::TextDelta }

        variant -> { Anthropic::Models::InputJSONDelta }
      end

      class TextDelta < Anthropic::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::TextDelta::Type]
        required :type, enum: -> { Anthropic::Models::TextDelta::Type }

        # @!parse
        #   # @param text [String]
        #   # @param type [String]
        #   #
        #   def initialize(text:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :text_delta
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TEXT_DELTA = :text_delta

          finalize!
        end
      end

      class InputJSONDelta < Anthropic::BaseModel
        # @!attribute partial_json
        #
        #   @return [String]
        required :partial_json, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::InputJSONDelta::Type]
        required :type, enum: -> { Anthropic::Models::InputJSONDelta::Type }

        # @!parse
        #   # @param partial_json [String]
        #   # @param type [String]
        #   #
        #   def initialize(partial_json:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :input_json_delta
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          INPUT_JSON_DELTA = :input_json_delta

          finalize!
        end
      end

      # @example
      #
      # ```ruby
      # case enum
      # in :content_block_delta
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        CONTENT_BLOCK_DELTA = :content_block_delta

        finalize!
      end
    end
  end
end
