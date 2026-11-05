# typed: strong

module Anthropic
  module Models
    module Organization
      # The External Key failed Anthropic's validation, so the request was refused. The
      # message gives the reason, if there is one.
      class ExternalKeyValidationFailedError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::ExternalKeyValidationFailedErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
