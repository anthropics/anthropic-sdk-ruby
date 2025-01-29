# typed: strong

module Anthropic
  module Models
    class CitationsConfigParam < Anthropic::BaseModel
      Shape = T.type_alias { {enabled: T::Boolean} }

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enabled

      sig { params(enabled: T::Boolean).void }
      attr_writer :enabled

      sig { params(enabled: T::Boolean).void }
      def initialize(enabled: nil); end

      sig { returns(Anthropic::Models::CitationsConfigParam::Shape) }
      def to_h; end
    end
  end
end
