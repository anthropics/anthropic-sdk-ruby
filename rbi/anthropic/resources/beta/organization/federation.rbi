# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Federation
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Federation::Issuers
            )
          end
          attr_reader :issuers

          sig do
            returns(Anthropic::Resources::Beta::Organization::Federation::Rules)
          end
          attr_reader :rules

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
