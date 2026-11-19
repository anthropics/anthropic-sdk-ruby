# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeCode
          class ManagedSettings
            sig do
              returns(
                Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::Configuration
              )
            end
            attr_reader :configuration

            sig do
              returns(
                Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroups
              )
            end
            attr_reader :rbac_groups

            sig do
              returns(
                Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefault
              )
            end
            attr_reader :rbac_group_default

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
