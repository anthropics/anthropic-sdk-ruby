# typed: strong

module Anthropic
  module Models
    BetaDreamErrorObject = Beta::BetaDreamErrorObject

    module Beta
      class BetaDreamErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        # A human-readable explanation of why the dream failed.
        sig { returns(String) }
        attr_accessor :message

        # A code for why the dream failed, such as `timeout` or `internal_error`.
        #
        # The
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#errors)
        # lists common error codes and when they occur.
        sig { returns(String) }
        attr_accessor :type

        # Failure detail for a Dream whose `status` is `failed`.
        sig { params(message: String, type: String).returns(T.attached_class) }
        def self.new(
          # A human-readable explanation of why the dream failed.
          message:,
          # A code for why the dream failed, such as `timeout` or `internal_error`.
          #
          # The
          # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#errors)
          # lists common error codes and when they occur.
          type:
        )
        end

        sig { override.returns({ message: String, type: String }) }
        def to_hash
        end
      end
    end
  end
end
