# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::PluginMarketplaces#update
        class PluginMarketplaceUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute marketplace_id
          #   ID of the plugin marketplace (prefixed `marketplace_`).
          #
          #   @return [String]
          required :marketplace_id, String

          # @!attribute default_installation_preference
          #   The organization-wide installation setting every Plugin in the marketplace
          #   without one of its own gets: one of `required`, `auto_install`, `available`,
          #   `not_available`. Once set it can be changed but not removed.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference]
          required :default_installation_preference,
                   enum: -> { Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference }

          # @!attribute betas
          #   This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(marketplace_id:, default_installation_preference:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::PluginMarketplaceUpdateParams} for more
          #   details.
          #
          #   @param marketplace_id [String] ID of the plugin marketplace (prefixed `marketplace_`).
          #
          #   @param default_installation_preference [Symbol, Anthropic::Models::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference] The organization-wide installation setting every Plugin in the marketplace witho
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # The organization-wide installation setting every Plugin in the marketplace
          # without one of its own gets: one of `required`, `auto_install`, `available`,
          # `not_available`. Once set it can be changed but not removed.
          module DefaultInstallationPreference
            extend Anthropic::Internal::Type::Enum

            AUTO_INSTALL = :auto_install
            AVAILABLE = :available
            NOT_AVAILABLE = :not_available
            REQUIRED = :required

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
