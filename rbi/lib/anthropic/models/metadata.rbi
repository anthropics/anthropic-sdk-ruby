# typed: strong

module Anthropic
  module Models
    class Metadata < Anthropic::BaseModel
      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

      sig { params(user_id: T.nilable(String)).returns(T.attached_class) }
      def self.new(user_id: nil)
      end

      sig { override.returns({user_id: T.nilable(String)}) }
      def to_hash
      end
    end
  end
end
