# typed: strong

module Anthropic
  module Models
    module Organization
      # Anthropic's validation of the External Key did not finish in time, so the
      # request was refused. Wait a moment, then send the request again.
      class ExternalKeyValidationTimedOutError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::ExternalKeyValidationTimedOutErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
