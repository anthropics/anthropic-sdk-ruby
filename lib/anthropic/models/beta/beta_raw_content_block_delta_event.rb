# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_raw_content_block_delta_event => {
      #   delta: Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta,
      #   index: Integer,
      #   type: :content_block_delta
      # }
      # ```
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
        # @!attribute delta
        #
        #   @return [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta]
        required :delta, union: -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_delta]
        required :type, const: :content_block_delta

        # @!parse
        #   # @param delta [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta]
        #   # @param index [Integer]
        #   # @param type [Symbol, :content_block_delta]
        #   #
        #   def initialize(delta:, index:, type: :content_block_delta, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case delta
        # in {type: "text_delta", text: String}
        #   # Anthropic::Models::Beta::BetaTextDelta ...
        # in {type: "input_json_delta", partial_json: String}
        #   # Anthropic::Models::Beta::BetaInputJSONDelta ...
        # in {type: "citations_delta", citation: Anthropic::Models::Beta::BetaCitationsDelta::Citation}
        #   # Anthropic::Models::Beta::BetaCitationsDelta ...
        # end
        # ```
        #
        # @example
        # ```ruby
        # case delta
        # in Anthropic::Models::Beta::BetaTextDelta
        #   # ...
        # in Anthropic::Models::Beta::BetaInputJSONDelta
        #   # ...
        # in Anthropic::Models::Beta::BetaCitationsDelta
        #   # ...
        # end
        # ```
        class Delta < Anthropic::Union
          discriminator :type

          variant :text_delta, -> { Anthropic::Models::Beta::BetaTextDelta }

          variant :input_json_delta, -> { Anthropic::Models::Beta::BetaInputJSONDelta }

          variant :citations_delta, -> { Anthropic::Models::Beta::BetaCitationsDelta }
        end
      end
    end

    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent
  end
end
