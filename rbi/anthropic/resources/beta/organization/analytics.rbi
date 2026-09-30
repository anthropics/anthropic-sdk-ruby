# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Analytics::Summaries
            )
          end
          attr_reader :summaries

          sig do
            returns(Anthropic::Resources::Beta::Organization::Analytics::Users)
          end
          attr_reader :users

          sig do
            returns(Anthropic::Resources::Beta::Organization::Analytics::Apps)
          end
          attr_reader :apps

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Analytics::Connectors
            )
          end
          attr_reader :connectors

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Analytics::Plugins
            )
          end
          attr_reader :plugins

          sig do
            returns(Anthropic::Resources::Beta::Organization::Analytics::Skills)
          end
          attr_reader :skills

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Analytics::Artifacts
            )
          end
          attr_reader :artifacts

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Analytics::UsageReport
            )
          end
          attr_reader :usage_report

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Analytics::UserUsageReport
            )
          end
          attr_reader :user_usage_report

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Analytics::CostReport
            )
          end
          attr_reader :cost_report

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Analytics::UserCostReport
            )
          end
          attr_reader :user_cost_report

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
