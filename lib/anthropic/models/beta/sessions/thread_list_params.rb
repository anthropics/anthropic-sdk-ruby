# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # @see Anthropic::Resources::Beta::Sessions::Threads#list
        class ThreadListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute session_id
          #
          #   @return [String]
          required :session_id, String

          # @!attribute limit
          #   Maximum results per page. Defaults to 1000.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   Opaque pagination cursor from a previous response's `next_page`. Forward-only.
          #
          #   @return [String, nil]
          optional :page, String

          # @!attribute statuses
          #   Return only threads that have one of these statuses.
          #
          #   Repeat the parameter to give more than one status. Leave it out to return
          #   threads of every status.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatus>, nil]
          optional :statuses,
                   -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus] }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
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

          # @!method initialize(session_id:, limit: nil, page: nil, statuses: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::ThreadListParams} for more details.
          #
          #   @param session_id [String]
          #
          #   @param limit [Integer] Maximum results per page. Defaults to 1000.
          #
          #   @param page [String] Opaque pagination cursor from a previous response's `next_page`. Forward-only.
          #
          #   @param statuses [Array<Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatus>] Return only threads that have one of these statuses.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
