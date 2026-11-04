# typed: strong

module Anthropic
  module Models
    module Beta
      # `settings.environment_id` names no Environment within the organization's reach.
      class BetaEnvironmentNotFoundError < Anthropic::Errors::NotFoundError
        sig { returns(Symbol) }
        def error_code
        end

        sig { returns(Anthropic::Beta::BetaEnvironmentNotFoundErrorDetails) }
        def details
        end
      end
    end
  end
end
