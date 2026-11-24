# typed: strong

module Anthropic
  module Resources
    class Beta
      class Compliance
        class Review
          sig { returns(Anthropic::Resources::Beta::Compliance::Review::Cases) }
          attr_reader :cases

          sig do
            returns(Anthropic::Resources::Beta::Compliance::Review::Notices)
          end
          attr_reader :notices

          sig { returns(Anthropic::Resources::Beta::Compliance::Review::Items) }
          attr_reader :items

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
