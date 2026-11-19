# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class ConfigurationUpdateParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationUpdateParams,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The new mode, as an object such as `{"type": "rbac_groups"}`.
              sig do
                returns(
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam,
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam
                    )
                  )
                )
              end
              attr_reader :mode

              sig do
                params(
                  mode:
                    T.any(
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam::OrHash,
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam::OrHash
                    )
                ).void
              end
              attr_writer :mode

              # Every RBAC Group that has settings, each listed once, in the new order, highest
              # precedence first. Requires `rbac_group_order_version`.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :rbac_group_order

              sig { params(rbac_group_order: T::Array[String]).void }
              attr_writer :rbac_group_order

              # The `rbac_group_order_version` from the read this change is based on. Requires
              # `rbac_group_order`.
              sig { returns(T.nilable(String)) }
              attr_reader :rbac_group_order_version

              sig { params(rbac_group_order_version: String).void }
              attr_writer :rbac_group_order_version

              # This endpoint is in beta: requests must send
              # `ce-claude-code-managed-settings-2026-10-06` in this header.
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
                  mode:
                    T.any(
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam::OrHash,
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam::OrHash
                    ),
                  rbac_group_order: T::Array[String],
                  rbac_group_order_version: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # The new mode, as an object such as `{"type": "rbac_groups"}`.
                mode: nil,
                # Every RBAC Group that has settings, each listed once, in the new order, highest
                # precedence first. Requires `rbac_group_order_version`.
                rbac_group_order: nil,
                # The `rbac_group_order_version` from the read this change is based on. Requires
                # `rbac_group_order`.
                rbac_group_order_version: nil,
                # This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
              )
              end

              sig do
                override.returns(
                  {
                    mode:
                      T.any(
                        Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam,
                        Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam
                      ),
                    rbac_group_order: T::Array[String],
                    rbac_group_order_version: String,
                    betas:
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ],
                    request_options: Anthropic::RequestOptions
                  }
                )
              end
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
