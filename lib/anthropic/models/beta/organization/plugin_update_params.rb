# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Plugins#update
        class PluginUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute plugin_id
          #   ID of the Plugin (prefixed `plugin_`).
          #
          #   @return [String]
          required :plugin_id, String

          # @!attribute served_version_id
          #   Serve this version of the Plugin (prefixed `pluginver_`) and pin the served
          #   version to it; `latest` is not accepted.
          #
          #   @return [String]
          required :served_version_id, String

          # @!attribute betas
          #   This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(plugin_id:, served_version_id:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::PluginUpdateParams} for more details.
          #
          #   @param plugin_id [String] ID of the Plugin (prefixed `plugin_`).
          #
          #   @param served_version_id [String] Serve this version of the Plugin (prefixed `pluginver_`) and pin the served vers
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
