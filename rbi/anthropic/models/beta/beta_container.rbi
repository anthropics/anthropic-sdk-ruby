# typed: strong

module Anthropic
  module Models
    BetaContainer = Beta::BetaContainer

    module Beta
      class BetaContainer < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaContainer, Anthropic::Internal::AnyHash)
          end

        # Identifier for the container used in this request
        sig { returns(String) }
        attr_accessor :id

        # The time at which the container will expire.
        sig { returns(Time) }
        attr_accessor :expires_at

        # Information about the container used in the request (for the code execution
        # tool)
        sig { params(id: String, expires_at: Time).returns(T.attached_class) }
        def self.new(
          # Identifier for the container used in this request
          id:,
          # The time at which the container will expire.
          expires_at:
        )
        end

        sig { override.returns({ id: String, expires_at: Time }) }
        def to_hash
        end
      end
    end
  end
end
