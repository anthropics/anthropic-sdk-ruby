# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # raw_content_block_delta_event => {
    #   delta: Anthropic::Models::RawContentBlockDeltaEvent::Delta,
    #   index: Integer,
    #   type: :content_block_delta
    # }
    # ```
    class RawContentBlockDeltaEvent < Anthropic::BaseModel
      # @!attribute delta
      #
      #   @return [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta]
      required :delta, union: -> { Anthropic::Models::RawContentBlockDeltaEvent::Delta }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_delta]
      required :type, const: :content_block_delta

      # @!parse
      #   # @param delta [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta]
      #   # @param index [Integer]
      #   # @param type [String]
      #   #
      #   def initialize(delta:, index:, type: :content_block_delta, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case delta
      # in {type: "text_delta", text: String}
      #   # Anthropic::Models::TextDelta ...
      # in {type: "input_json_delta", partial_json: String}
      #   # Anthropic::Models::InputJSONDelta ...
      # in {type: "citations_delta", citation: Anthropic::Models::CitationsDelta::Citation}
      #   # Anthropic::Models::CitationsDelta ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case delta
      # in Anthropic::Models::TextDelta
      #   # ...
      # in Anthropic::Models::InputJSONDelta
      #   # ...
      # in Anthropic::Models::CitationsDelta
      #   # ...
      # end
      # ```
      class Delta < Anthropic::Union
        discriminator :type

        variant :text_delta, -> { Anthropic::Models::TextDelta }

        variant :input_json_delta, -> { Anthropic::Models::InputJSONDelta }

        variant :citations_delta, -> { Anthropic::Models::CitationsDelta }
      end
    end
  end
end
