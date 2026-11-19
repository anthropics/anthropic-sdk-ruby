# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            module BetaClaudeCodeManagedSettingsModeParam
              extend Anthropic::Internal::Type::Union

              discriminator :type

              variant :organization,
                      -> { Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam }

              variant :rbac_groups,
                      -> { Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam }

              module Type
                extend Anthropic::Internal::Type::Enum

                ORGANIZATION = :organization
                RBAC_GROUPS = :rbac_groups

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsModeParam::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam]
              def self.new(type:, **args)
                case type.to_sym
                when :organization
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam.new(
                    **args
                  )
                when :rbac_groups
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam.new(
                    **args
                  )
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end
          end
        end
      end
    end
  end
end
