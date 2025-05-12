# typed: strong

module Anthropic
  module Models
    BetaModelInfo = Beta::BetaModelInfo

    module Beta
      class BetaModelInfo < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaModelInfo, Anthropic::Internal::AnyHash)
          end

        # Unique model identifier.
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 datetime string representing the time at which the model was released.
        # May be set to an epoch value if the release date is unknown.
        sig { returns(Time) }
        attr_accessor :created_at

        # A human-readable name for the model.
        sig { returns(String) }
        attr_accessor :display_name

        # Object type.
        #
        # For Models, this is always `"model"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created_at: Time,
            display_name: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique model identifier.
          id:,
          # RFC 3339 datetime string representing the time at which the model was released.
          # May be set to an epoch value if the release date is unknown.
          created_at:,
          # A human-readable name for the model.
          display_name:,
          # Object type.
          #
          # For Models, this is always `"model"`.
          type: :model
        )
        end

        sig do
          override.returns(
            { id: String, created_at: Time, display_name: String, type: Symbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
