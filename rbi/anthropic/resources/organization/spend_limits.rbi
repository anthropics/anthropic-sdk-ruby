# typed: strong

module Anthropic
  module Resources
    class Organization
      class SpendLimits
        sig do
          returns(Anthropic::Resources::Organization::SpendLimits::Effective)
        end
        attr_reader :effective

        sig do
          returns(
            Anthropic::Resources::Organization::SpendLimits::IncreaseRequests
          )
        end
        attr_reader :increase_requests

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
