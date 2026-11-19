# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefault#retrieve
            class BetaClaudeCodeRBACGroupDefaultManagedSettings < Anthropic::Internal::Type::BaseModel
              # @!attribute settings
              #   The default settings document, or `null` if none are set or the stored document
              #   is damaged and can no longer be read. To tell these apart, `updated_at` is
              #   `null` only when none are set. Replacing a damaged document fixes this.
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :settings,
                       Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown],
                       nil?: true

              # @!attribute type
              #   Always `claude_code_rbac_group_default_managed_settings`.
              #
              #   @return [Symbol, :claude_code_rbac_group_default_managed_settings]
              required :type, const: :claude_code_rbac_group_default_managed_settings

              # @!attribute updated_at
              #   When the default settings last changed, in RFC 3339 format, or `null` if none
              #   are set.
              #
              #   @return [Time, nil]
              required :updated_at, Time, nil?: true

              # @!method initialize(settings:, updated_at:, type: :claude_code_rbac_group_default_managed_settings)
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings}
              #   for more details.
              #
              #   @param settings [Hash{Symbol=>Object}, nil] The default settings document, or `null` if none are set or the stored document
              #
              #   @param updated_at [Time, nil] When the default settings last changed, in RFC 3339 format, or `null` if none ar
              #
              #   @param type [Symbol, :claude_code_rbac_group_default_managed_settings] Always `claude_code_rbac_group_default_managed_settings`.
            end
          end
        end
      end
    end
  end
end
