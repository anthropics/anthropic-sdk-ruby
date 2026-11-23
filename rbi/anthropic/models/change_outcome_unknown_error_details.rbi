# typed: strong

module Anthropic
  module Models
    class ChangeOutcomeUnknownErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ChangeOutcomeUnknownErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # Some of the request's changes may have been saved and others not. Send the same
      # request again to finish it; changes already saved aren't repeated.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :change_outcome_unknown)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
