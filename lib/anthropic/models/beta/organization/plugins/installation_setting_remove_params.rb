# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          # @see Anthropic::Resources::Beta::Organization::Plugins::InstallationSettings#remove
          class InstallationSettingRemoveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute plugin_id
            #   ID of the Plugin (prefixed `plugin_`).
            #
            #   @return [String]
            required :plugin_id, String

            # @!attribute target
            #   The target whose own setting is removed: the literal `organization` for the
            #   Plugin's organization-wide setting, or an RBAC Group's ID (prefixed
            #   `rbac_group_`) for that group's own setting. Removing the `organization` setting
            #   returns the Plugin to its marketplace's default.
            #
            #   @return [String]
            required :target, String

            # @!attribute betas
            #   This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
            #   header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(plugin_id:, target:, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Plugins::InstallationSettingRemoveParams}
            #   for more details.
            #
            #   @param plugin_id [String] ID of the Plugin (prefixed `plugin_`).
            #
            #   @param target [String] The target whose own setting is removed: the literal `organization` for the Plug
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
