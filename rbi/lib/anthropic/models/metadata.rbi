# typed: strong

module Anthropic
  module Models
    class Metadata < Anthropic::BaseModel
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig { params(user_id: T.nilable(String)).void }
      def initialize(user_id: nil)
      end

      sig { override.returns({user_id: T.nilable(String)}) }
      def to_hash
      end
    end
  end
end
