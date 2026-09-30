# typed: strong

module Anthropic
  module Resources
    class Organization
      class Federation
        sig { returns(Anthropic::Resources::Organization::Federation::Issuers) }
        attr_reader :issuers

        sig { returns(Anthropic::Resources::Organization::Federation::Rules) }
        attr_reader :rules

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
