# typed: strong

module Anthropic
  module Models
    module Organization
      # The external key changed while the request was validating it. Send the request
      # again.
      class ExternalKeyChangedError < Anthropic::Errors::ConflictError
        sig { returns(Symbol) }
        def error_code
        end

        sig { returns(Anthropic::Organization::ExternalKeyChangedErrorDetails) }
        def details
        end
      end
    end
  end
end
