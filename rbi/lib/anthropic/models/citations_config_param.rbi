# typed: strong

module Anthropic
  module Models
    class CitationsConfigParam < Anthropic::BaseModel
      sig { returns(T.nilable(T::Boolean)) }
      def enabled
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def enabled=(_)
      end

      sig { params(enabled: T::Boolean).void }
      def initialize(enabled: nil)
      end

      sig { override.returns({enabled: T::Boolean}) }
      def to_hash
      end
    end
  end
end
