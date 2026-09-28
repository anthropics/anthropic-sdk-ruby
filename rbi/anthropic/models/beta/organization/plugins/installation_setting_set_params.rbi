# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          class InstallationSettingSetParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the Plugin (prefixed `plugin_`).
            sig { returns(String) }
            attr_accessor :plugin_id

            # The target whose setting is written: the literal `organization` for the Plugin's
            # organization-wide setting, or an RBAC Group's ID (prefixed `rbac_group_`) for
            # that group's own setting. Writing the `organization` target stops the Plugin
            # from inheriting its marketplace's default, even when the value written equals
            # that default.
            sig { returns(String) }
            attr_accessor :target

            # The installation setting the target is to hold for this Plugin: one of
            # `required`, `auto_install`, `available`, `not_available`.
            sig do
              returns(
                Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::OrSymbol
              )
            end
            attr_accessor :installation_preference

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
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                plugin_id: String,
                target: String,
                installation_preference:
                  Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::OrSymbol,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the Plugin (prefixed `plugin_`).
              plugin_id:,
              # The target whose setting is written: the literal `organization` for the Plugin's
              # organization-wide setting, or an RBAC Group's ID (prefixed `rbac_group_`) for
              # that group's own setting. Writing the `organization` target stops the Plugin
              # from inheriting its marketplace's default, even when the value written equals
              # that default.
              target:,
              # The installation setting the target is to hold for this Plugin: one of
              # `required`, `auto_install`, `available`, `not_available`.
              installation_preference:,
              # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
              # header.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  plugin_id: String,
                  target: String,
                  installation_preference:
                    Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::OrSymbol,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end

            # The installation setting the target is to hold for this Plugin: one of
            # `required`, `auto_install`, `available`, `not_available`.
            module InstallationPreference
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AUTO_INSTALL =
                T.let(
                  :auto_install,
                  Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::TaggedSymbol
                )
              AVAILABLE =
                T.let(
                  :available,
                  Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::TaggedSymbol
                )
              NOT_AVAILABLE =
                T.let(
                  :not_available,
                  Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::TaggedSymbol
                )
              REQUIRED =
                T.let(
                  :required,
                  Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::TaggedSymbol
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
end
