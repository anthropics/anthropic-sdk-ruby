# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # @see Anthropic::Resources::Beta::Sessions::Events#send_
        class EventSendParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute session_id
          #
          #   @return [String]
          required :session_id, String

          # @!attribute events
          #   Events to send to the `session`.
          #
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams>]
          required :events,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsEventParams] }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(session_id:, events:, betas: nil, request_options: {})
          #   @param session_id [String]
          #
          #   @param events [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams>] Events to send to the `session`.
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
