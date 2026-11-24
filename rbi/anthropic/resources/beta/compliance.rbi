# typed: strong

module Anthropic
  module Resources
    class Beta
      class Compliance
        sig { returns(Anthropic::Resources::Beta::Compliance::Review) }
        attr_reader :review

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
