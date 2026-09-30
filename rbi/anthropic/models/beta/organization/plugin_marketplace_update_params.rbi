# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class PluginMarketplaceUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::PluginMarketplaceUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the plugin marketplace (prefixed `marketplace_`).
          sig { returns(String) }
          attr_accessor :marketplace_id

          # The organization-wide installation setting every Plugin in the marketplace
          # without one of its own gets: one of `required`, `auto_install`, `available`,
          # `not_available`. Once set it can be changed but not removed.
          sig do
            returns(
              Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference::OrSymbol
            )
          end
          attr_accessor :default_installation_preference

          # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
          # header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              marketplace_id: String,
              default_installation_preference:
                Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference::OrSymbol,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the plugin marketplace (prefixed `marketplace_`).
            marketplace_id:,
            # The organization-wide installation setting every Plugin in the marketplace
            # without one of its own gets: one of `required`, `auto_install`, `available`,
            # `not_available`. Once set it can be changed but not removed.
            default_installation_preference:,
            # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
            # header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                marketplace_id: String,
                default_installation_preference:
                  Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference::OrSymbol,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # The organization-wide installation setting every Plugin in the marketplace
          # without one of its own gets: one of `required`, `auto_install`, `available`,
          # `not_available`. Once set it can be changed but not removed.
          module DefaultInstallationPreference
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AUTO_INSTALL =
              T.let(
                :auto_install,
                Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference::TaggedSymbol
              )
            AVAILABLE =
              T.let(
                :available,
                Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference::TaggedSymbol
              )
            NOT_AVAILABLE =
              T.let(
                :not_available,
                Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference::TaggedSymbol
              )
            REQUIRED =
              T.let(
                :required,
                Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
