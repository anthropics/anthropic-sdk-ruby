# typed: strong

module Anthropic
  module Models
    class SkillReadBlockedUndecryptableErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::SkillReadBlockedUndecryptableErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # A custom skill the request names is stored under an encryption key state the
      # workspace cannot currently decrypt.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :skill_read_blocked_undecryptable)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
