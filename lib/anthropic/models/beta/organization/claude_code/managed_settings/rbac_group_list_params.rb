# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroups#list
            class RBACGroupListParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              # @!attribute limit
              #   Number of items to return per page.
              #
              #   Defaults to `20`. Ranges from `1` to `100`.
              #
              #   @return [Integer, nil]
              optional :limit, Integer

              # @!attribute page
              #   Optionally set to the `next_page` token from the previous response.
              #
              #   @return [String, nil]
              optional :page, String, nil?: true

              # @!attribute betas
              #   This endpoint is in beta: requests must send
              #   `ce-claude-code-managed-settings-2026-10-06` in this header.
              #
              #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
              optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

              # @!method initialize(limit: nil, page: nil, betas: nil, request_options: {})
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupListParams}
              #   for more details.
              #
              #   @param limit [Integer] Number of items to return per page.
              #
              #   @param page [String, nil] Optionally set to the `next_page` token from the previous response.
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
