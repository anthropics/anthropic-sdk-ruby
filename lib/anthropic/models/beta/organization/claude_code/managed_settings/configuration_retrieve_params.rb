# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::Configuration#retrieve
            class ConfigurationRetrieveParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              # @!attribute betas
              #   This endpoint is in beta: requests must send
              #   `ce-claude-code-managed-settings-2026-10-06` in this header.
              #
              #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
              optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

              # @!method initialize(betas: nil, request_options: {})
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationRetrieveParams}
              #   for more details.
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
