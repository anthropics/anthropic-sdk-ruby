# typed: strong

module Anthropic
  module Models
    class Completion < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          id: String,
          completion: String,
          model: Anthropic::Models::Model::Variants,
          stop_reason: T.nilable(String),
          type: Symbol
        }
      end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :completion

      sig { returns(Anthropic::Models::Model::Variants) }
      attr_accessor :model

      sig { returns(T.nilable(String)) }
      attr_accessor :stop_reason

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          completion: String,
          model: Anthropic::Models::Model::Variants,
          stop_reason: T.nilable(String),
          type: Symbol
        ).void
      end
      def initialize(id:, completion:, model:, stop_reason:, type: :completion); end

      sig { returns(Anthropic::Models::Completion::Shape) }
      def to_h; end
    end
  end
end
