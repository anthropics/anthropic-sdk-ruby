# typed: strong

module Anthropic
  module Models
    module Beta
      # The environment is archived, so it cannot be updated.
      class BetaEnvironmentArchivedError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig { returns(Anthropic::Beta::BetaEnvironmentArchivedErrorDetails) }
        def details
        end
      end
    end
  end
end
