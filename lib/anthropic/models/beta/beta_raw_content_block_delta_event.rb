# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
        # @!attribute delta
        #
        #   @return [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta]
        required :delta, union: -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Type }

        # @!parse
        #   # @param delta [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta]
        #   # @param index [Integer]
        #   # @param type [String]
        #   #
        #   def initialize(delta:, index:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case union
        # in Anthropic::Models::Beta::BetaTextDelta
        #   # ...
        # in Anthropic::Models::Beta::BetaInputJSONDelta
        #   # ...
        # end
        # ```
        class Delta < Anthropic::Union
          variant -> { Anthropic::Models::Beta::BetaTextDelta }

          variant -> { Anthropic::Models::Beta::BetaInputJSONDelta }
        end

        class BetaTextDelta < Anthropic::BaseModel
          # @!attribute text
          #
          #   @return [String]
          required :text, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaTextDelta::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaTextDelta::Type }

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
          end
        end

        class BetaInputJSONDelta < Anthropic::BaseModel
          # @!attribute partial_json
          #
          #   @return [String]
          required :partial_json, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaInputJSONDelta::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaInputJSONDelta::Type }

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
        end
      end
    end

    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent
  end
end
