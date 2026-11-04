# typed: strong

module Anthropic
  module Models
    module Organization
      # The External Key is bound to a user profile, and the Workspace does not have
      # that user profile. A Workspace can use only a key bound to its own user profile
      # or a key that isn't bound to one.
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
