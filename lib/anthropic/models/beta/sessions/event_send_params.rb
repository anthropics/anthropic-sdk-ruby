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
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams>]
          required :events,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsEventParams] }

          # @!attribute betas
          #   This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!attribute workspace_id
          #   Optional header to select the Workspace for this request. The value is a
          #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          #   Only needed for credentials that can act on more than one Workspace. A
          #   credential that belongs to a specific Workspace may omit it; if sent, it must
          #   match that Workspace.
          #
          #   @return [String, nil]
          optional :workspace_id, String

          # @!method initialize(session_id:, events:, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::EventSendParams} for more details.
          #
          #   @param session_id [String]
          #
          #   @param events [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams>] Events to send to the `session`.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
          #
          #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
