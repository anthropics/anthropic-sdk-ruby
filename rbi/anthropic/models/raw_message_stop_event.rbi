# typed: strong

module Anthropic
  module Models
    class RawMessageStopEvent < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::RawMessageStopEvent, Anthropic::Internal::AnyHash)
        end

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(type: Symbol).returns(T.attached_class) }
      def self.new(type: :message_stop)
      end

      sig { override.returns({ type: Symbol }) }
      def to_hash
      end
    end
  end
end
