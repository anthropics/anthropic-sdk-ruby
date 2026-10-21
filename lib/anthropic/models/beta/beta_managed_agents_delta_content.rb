# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsDeltaContent < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   A partial element of the content array at index, typed like the element itself —
        #   the same shape the buffered agent.message carries in content.
        #
        #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock]
        required :content, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock }

        # @!attribute type
        #
        #   @return [Symbol, :content_delta]
        required :type, const: :content_delta

        # @!attribute index
        #   Which entry in the previewed event's content array this fragment lands in.
        #   Insert content as that entry when the index is new; append to the existing entry
        #   otherwise.
        #
        #   @return [Integer, nil]
        optional :index, Integer

        # @!method initialize(content:, index: nil, type: :content_delta)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsDeltaContent} for more details.
        #
        #   @param content [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock] A partial element of the content array at index, typed like the element itself —
        #
        #   @param index [Integer] Which entry in the previewed event's content array this fragment lands in. Inser
        #
        #   @param type [Symbol, :content_delta]
      end
    end

    BetaManagedAgentsDeltaContent = Beta::BetaManagedAgentsDeltaContent
  end
end
