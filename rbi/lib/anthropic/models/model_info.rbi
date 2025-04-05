# typed: strong

module Anthropic
  module Models
    class ModelInfo < Anthropic::Internal::Type::BaseModel
      # Unique model identifier.
      sig { returns(String) }
      attr_accessor :id

      # RFC 3339 datetime string representing the time at which the model was released.
      #   May be set to an epoch value if the release date is unknown.
      sig { returns(Time) }
      attr_accessor :created_at

      # A human-readable name for the model.
      sig { returns(String) }
      attr_accessor :display_name

      # Object type.
      #
      #   For Models, this is always `"model"`.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(id: String, created_at: Time, display_name: String, type: Symbol).returns(T.attached_class)
      end
      def self.new(id:, created_at:, display_name:, type: :model); end

      sig { override.returns({id: String, created_at: Time, display_name: String, type: Symbol}) }
      def to_hash; end
    end
  end
end
