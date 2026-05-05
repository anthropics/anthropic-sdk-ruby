# typed: strong

module Anthropic
  module Resources
    class Beta
      sig { returns(Anthropic::Resources::Beta::Models) }
      attr_reader :models

      sig { returns(Anthropic::Resources::Beta::Messages) }
      attr_reader :messages

      sig { returns(Anthropic::Resources::Beta::Agents) }
      attr_reader :agents

      sig { returns(Anthropic::Resources::Beta::Environments) }
      attr_reader :environments

      sig { returns(Anthropic::Resources::Beta::Sessions) }
      attr_reader :sessions

      sig { returns(Anthropic::Resources::Beta::Vaults) }
      attr_reader :vaults

      sig { returns(Anthropic::Resources::Beta::MemoryStores) }
      attr_reader :memory_stores

      sig { returns(Anthropic::Resources::Beta::Files) }
      attr_reader :files

      sig { returns(Anthropic::Resources::Beta::Skills) }
      attr_reader :skills

      sig { returns(Anthropic::Resources::Beta::Webhooks) }
      attr_reader :webhooks

      sig { returns(Anthropic::Resources::Beta::UserProfiles) }
      attr_reader :user_profiles

      # @api private
      sig { params(client: Anthropic::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
