# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefault#update
            class RBACGroupDefaultUpdateParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              # @!attribute settings
              #   The whole settings document, a JSON object of Claude Code managed settings. It
              #   replaces any stored document, or `null` clears the default settings. At most 1
              #   MiB as the server stores it, which can be larger than the request body.
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :settings,
                       Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown],
                       nil?: true

              # @!attribute betas
              #   This endpoint is in beta: requests must send
              #   `ce-claude-code-managed-settings-2026-10-06` in this header.
              #
              #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
              optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

              # @!method initialize(settings:, betas: nil, request_options: {})
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultUpdateParams}
              #   for more details.
              #
              #   @param settings [Hash{Symbol=>Object}, nil] The whole settings document, a JSON object of Claude Code managed settings. It r
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
