# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Providers
          sig do
            returns(Anthropic::Resources::Beta::Organization::Providers::Google)
          end
          attr_reader :google

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
