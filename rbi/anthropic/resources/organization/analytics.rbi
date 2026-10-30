# typed: strong

module Anthropic
  module Resources
    class Organization
      class Analytics
        sig do
          returns(Anthropic::Resources::Organization::Analytics::Summaries)
        end
        attr_reader :summaries

        sig { returns(Anthropic::Resources::Organization::Analytics::Users) }
        attr_reader :users

        sig { returns(Anthropic::Resources::Organization::Analytics::Apps) }
        attr_reader :apps

        sig do
          returns(Anthropic::Resources::Organization::Analytics::Connectors)
        end
        attr_reader :connectors

        sig { returns(Anthropic::Resources::Organization::Analytics::Plugins) }
        attr_reader :plugins

        sig { returns(Anthropic::Resources::Organization::Analytics::Skills) }
        attr_reader :skills

        sig do
          returns(Anthropic::Resources::Organization::Analytics::Artifacts)
        end
        attr_reader :artifacts

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
