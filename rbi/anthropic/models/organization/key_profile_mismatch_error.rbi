# typed: strong

module Anthropic
  module Models
    module Organization
      # After this request, the External Key and the Workspace would not have the same
      # user profile. A key and its Workspace must have the same user profile, or both
      # have none.
      class KeyProfileMismatchError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig { returns(Anthropic::Organization::KeyProfileMismatchErrorDetails) }
        def details
        end
      end
    end
  end
end
