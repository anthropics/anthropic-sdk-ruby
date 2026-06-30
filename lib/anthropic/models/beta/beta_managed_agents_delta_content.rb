# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsDeltaContent < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   Regular text content.
        #
        #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock]
        required :content, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeltaContent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeltaContent::Type }

        # @!attribute index
        #   Which entry in the previewed event's content array this fragment lands in.
        #   Insert content as that entry when the index is new; append to the existing entry
        #   otherwise.
        #
        #   @return [Integer, nil]
        optional :index, Integer

        # @!method initialize(content:, type:, index: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsDeltaContent} for more details.
        #
        #   @param content [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock] Regular text content.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeltaContent::Type]
        #
        #   @param index [Integer] Which entry in the previewed event's content array this fragment lands in. Inser

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeltaContent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CONTENT_DELTA = :content_delta

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeltaContent = Beta::BetaManagedAgentsDeltaContent
  end
end
