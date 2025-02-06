# typed: strong

module Anthropic
  module Resources
    class Beta
      sig { returns(Anthropic::Resources::Beta::Models) }
      attr_reader :models

      sig { returns(Anthropic::Resources::Beta::Messages) }
      attr_reader :messages

      sig { params(client: Anthropic::Client).void }
      def initialize(client:)
      end
    end
  end
end
