# typed: strong

module Anthropic
  module Models
    class CitationsConfigParam < Anthropic::BaseModel
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      sig { params(enabled: T::Boolean).void }
      def initialize(enabled: nil)
      end

      sig { override.returns({enabled: T::Boolean}) }
      def to_hash
      end
    end
  end
end
