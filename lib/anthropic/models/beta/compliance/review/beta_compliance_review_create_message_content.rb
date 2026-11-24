# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewCreateMessageContent < Anthropic::Internal::Type::BaseModel
            # @!attribute request
            #   The `POST /v1/messages` request body, without thinking blocks or unpublished
            #   fields. For a user's message from an Anthropic app, such as Claude Code,
            #   `system` is a placeholder.
            #
            #   @return [Hash{Symbol=>Object}]
            required :request, Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]

            # @!attribute response
            #   The model's `Message`, without thinking blocks or unpublished fields. Null when
            #   no response was stored, for example because the client disconnected.
            #
            #   @return [Anthropic::Models::Beta::BetaMessage, nil]
            required :response, -> { Anthropic::Beta::BetaMessage }, nil?: true

            # @!attribute type
            #
            #   @return [Symbol, :create_message]
            required :type, const: :create_message

            # @!method initialize(request:, response:, type: :create_message)
            #   A request to create a message, and its response.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCreateMessageContent}
            #   for more details.
            #
            #   @param request [Hash{Symbol=>Object}] The `POST /v1/messages` request body, without thinking blocks or unpublished fie
            #
            #   @param response [Anthropic::Models::Beta::BetaMessage, nil] The model's `Message`, without thinking blocks or unpublished fields. Null when
            #
            #   @param type [Symbol, :create_message]
          end
        end
      end
    end
  end
end
