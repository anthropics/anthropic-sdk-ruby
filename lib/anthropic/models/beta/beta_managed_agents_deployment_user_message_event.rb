# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsDeploymentUserMessageEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   Array of content blocks for the user message.
        #
        #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>]
        required :content,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Content] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type }

        # @!method initialize(content:, type:)
        #   A user message sent to the session.
        #
        #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>] Array of content blocks for the user message.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type]

        # Content block in a user message. Can be `text`, `image`, or `document`.
        module Content
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Regular text content.
          variant :text, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock }

          # Image content specified directly as base64 data or as a reference via a URL.
          variant :image, -> { Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock }

          # Document content, either specified directly as base64 data, as text, or as a reference via a URL.
          variant :document, -> { Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock)]
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserMessageEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          USER_MESSAGE = :"user.message"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeploymentUserMessageEvent = Beta::BetaManagedAgentsDeploymentUserMessageEvent
  end
end
