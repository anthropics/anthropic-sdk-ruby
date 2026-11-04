# typed: strong

module Anthropic
  module Models
    module Beta
      # `config.type` differs from the environment's stored type, which cannot change
      # after creation.
      class BetaInvalidConfigTypeChangeError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Beta::BetaInvalidConfigTypeChangeErrorDetails)
        end
        def details
        end
      end
    end
  end
end
