# typed: strong

module Anthropic
  module Models
    class BetaCMEKNotApprovedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaCMEKNotApprovedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # Anthropic has not approved customer-managed encryption keys for the
      # organization, project or user profile this request applies to, or has paused or
      # withdrawn its approval. If you did not expect this, contact Anthropic.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :cmek_not_approved)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
