# typed: strong

module Anthropic
  module Models
    BetaDreamError = Beta::BetaDreamError

    module Beta
      class BetaDreamError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaDreamError, Anthropic::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :message

        sig { returns(String) }
        attr_accessor :type

        # Failure detail for a Dream whose `status` is `failed`.
        sig { params(message: String, type: String).returns(T.attached_class) }
        def self.new(message:, type:)
        end

        sig { override.returns({ message: String, type: String }) }
        def to_hash
        end
      end
    end
  end
end
