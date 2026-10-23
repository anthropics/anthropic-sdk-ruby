# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeTag
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels
            )
          end
          attr_reader :slack_channels

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::ClaudeTag::SlackWorkspaces
            )
          end
          attr_reader :slack_workspaces

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles
            )
          end
          attr_reader :bundles

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
