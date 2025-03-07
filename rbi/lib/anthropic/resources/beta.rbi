# typed: strong

module Anthropic
  module Resources
    class Beta
      sig { returns(Anthropic::Resources::Beta::Models) }
      def models
      end

      sig { returns(Anthropic::Resources::Beta::Messages) }
      def messages
      end

      sig { params(client: Anthropic::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
