# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The request can't use External Storage on this cloud provider. The error's
        # message says why.
        class BetaProviderNotAllowedError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaProviderNotAllowedErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
