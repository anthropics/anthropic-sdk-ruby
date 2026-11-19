# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroups#set
            class RBACGroupSetParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              # @!attribute rbac_group_id
              #   The RBAC Group's ID, prefixed `rbac_group_`.
              #
              #   @return [String]
              required :rbac_group_id, String

              # @!attribute settings
              #   The whole settings document, a JSON object of Claude Code managed settings. It
              #   replaces any stored document. At most 1 MiB as the server stores it, which can
              #   be larger than the request body.
              #
              #   @return [Hash{Symbol=>Object}]
              required :settings, Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]

              # @!attribute betas
              #   This endpoint is in beta: requests must send
              #   `ce-claude-code-managed-settings-2026-10-06` in this header.
              #
              #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
              optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

              # @!method initialize(rbac_group_id:, settings:, betas: nil, request_options: {})
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupSetParams}
              #   for more details.
              #
              #   @param rbac_group_id [String] The RBAC Group's ID, prefixed `rbac_group_`.
              #
              #   @param settings [Hash{Symbol=>Object}] The whole settings document, a JSON object of Claude Code managed settings. It r
              #
              #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
              #
              #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
            end
          end
        end
      end
    end
  end
end
