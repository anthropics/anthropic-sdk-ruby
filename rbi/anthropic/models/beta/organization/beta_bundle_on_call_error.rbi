# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # This Bundle's instructions are managed in claude.ai and can't be changed through
        # the API.
        class BetaBundleOnCallError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(Anthropic::Beta::Organization::BetaBundleOnCallErrorDetails)
          end
          def details
          end
        end
      end
    end
  end
end
