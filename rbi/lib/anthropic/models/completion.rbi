# typed: strong

module Anthropic
  module Models
    class Completion < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :completion

      sig { returns(T.any(Symbol, String)) }
      attr_accessor :model

      sig { returns(T.nilable(String)) }
      attr_accessor :stop_reason

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          completion: String,
          model: T.any(Symbol, String),
          stop_reason: T.nilable(String),
          type: Symbol
        ).void
      end
      def initialize(id:, completion:, model:, stop_reason:, type: :completion)
      end

      sig do
        override.returns(
          {
            id: String,
            completion: String,
            model: T.any(Symbol, String),
            stop_reason: T.nilable(String),
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
