# typed: strong

module Anthropic
  module Models
    class Metadata < Anthropic::BaseModel
      Shape = T.type_alias { {user_id: T.nilable(String)} }

      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig { params(user_id: T.nilable(String)).void }
      def initialize(user_id: nil); end

      sig { returns(Anthropic::Models::Metadata::Shape) }
      def to_h; end
    end
  end
end
