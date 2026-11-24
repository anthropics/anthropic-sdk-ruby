# typed: strong

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        class Providers
          sig do
            returns(Anthropic::Resources::Beta::UserProfiles::Providers::Google)
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
