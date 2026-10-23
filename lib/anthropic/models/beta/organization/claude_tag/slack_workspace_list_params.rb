# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::SlackWorkspaces#list
          class SlackWorkspaceListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute include_inherited
            #   When `true`, `settings` holds what applies in each workspace once the
            #   organization's Slack defaults are taken into account, and every member of
            #   `sources` names the level a value comes from. When `false` or left out,
            #   `settings` holds what each workspace itself stores.
            #
            #   @return [Boolean, nil]
            optional :include_inherited, Anthropic::Internal::Type::Boolean

            # @!attribute limit
            #   Number of items to return per page, between 1 and 100. Defaults to 20.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page`.
            #
            #   @return [String, nil]
            optional :page, String

            # @!attribute slack_workspace_id
            #   Slack's identifier for one workspace, as in the workspace object's
            #   `slack.workspace_id`, not its `id`. With it `data` holds that workspace alone,
            #   or nothing when it is not set up.
            #
            #   @return [String, nil]
            optional :slack_workspace_id, String

            # @!attribute betas
            #   This endpoint is in beta: requests must send
            #   `experimental-claude-tag-2026-10-21` in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(include_inherited: nil, limit: nil, page: nil, slack_workspace_id: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::SlackWorkspaceListParams} for
            #   more details.
            #
            #   @param include_inherited [Boolean] When `true`, `settings` holds what applies in each workspace once the organizati
            #
            #   @param limit [Integer] Number of items to return per page, between 1 and 100. Defaults to 20.
            #
            #   @param page [String] Opaque cursor from a previous response's `next_page`.
            #
            #   @param slack_workspace_id [String] Slack's identifier for one workspace, as in the workspace object's `slack.worksp
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `experimental-claude-tag-2026-10-21
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
