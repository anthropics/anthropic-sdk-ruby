# typed: strong

module Anthropic
  module Models
    class ModelInfo < Anthropic::BaseModel
      # Unique model identifier.
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # RFC 3339 datetime string representing the time at which the model was released.
      #   May be set to an epoch value if the release date is unknown.
      sig { returns(Time) }
      def created_at
      end

      sig { params(_: Time).returns(Time) }
      def created_at=(_)
      end

      # A human-readable name for the model.
      sig { returns(String) }
      def display_name
      end

      sig { params(_: String).returns(String) }
      def display_name=(_)
      end

      # Object type.
      #
      #   For Models, this is always `"model"`.
      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(id: String, created_at: Time, display_name: String, type: Symbol).returns(T.attached_class)
      end
      def self.new(id:, created_at:, display_name:, type: :model)
      end

      sig { override.returns({id: String, created_at: Time, display_name: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end
