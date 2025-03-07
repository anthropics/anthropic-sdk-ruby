# typed: strong

module Anthropic
  module Models
    class Completion < Anthropic::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(String) }
      def completion
      end

      sig { params(_: String).returns(String) }
      def completion=(_)
      end

      sig { returns(T.any(Symbol, String)) }
      def model
      end

      sig { params(_: T.any(Symbol, String)).returns(T.any(Symbol, String)) }
      def model=(_)
      end

      sig { returns(T.nilable(String)) }
      def stop_reason
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def stop_reason=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(
          id: String,
          completion: String,
          model: T.any(Symbol, String),
          stop_reason: T.nilable(String),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(id:, completion:, model:, stop_reason:, type: :completion)
      end

      sig do
        override
          .returns(
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
