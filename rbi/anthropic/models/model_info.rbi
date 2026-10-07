# typed: strong

module Anthropic
  module Models
    class ModelInfo < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ModelInfo, Anthropic::Internal::AnyHash)
        end

      # Unique model identifier.
      sig { returns(String) }
      attr_accessor :id

      # Object mapping capability names to their support details. Keys are always
      # present for all known capabilities.
      sig { returns(T.nilable(Anthropic::ModelCapabilities)) }
      attr_reader :capabilities

      sig do
        params(
          capabilities: T.nilable(Anthropic::ModelCapabilities::OrHash)
        ).void
      end
      attr_writer :capabilities

      # RFC 3339 datetime string representing the time at which the model was released.
      # May be set to an epoch value if the release date is unknown.
      sig { returns(Time) }
      attr_accessor :created_at

      # RFC 3339 datetime string representing the time of the model's most recent
      # deprecation. Populated for `deprecated` and `retired` models; `null` while the
      # model is `active`.
      sig { returns(T.nilable(Time)) }
      attr_accessor :deprecated_at

      # A human-readable name for the model.
      sig { returns(String) }
      attr_accessor :display_name

      # The model's current lifecycle stage.
      #
      # - `active`: The model is available for use, open to new adopters, and not
      #   scheduled for retirement.
      # - `deprecated`: The model remains callable for organizations with existing
      #   access, but is headed for retirement and closed to new adopters.
      # - `retired`: The model is no longer available for use; inference requests naming
      #   it fail. It remains in the catalogue as the historical record of its
      #   retirement.
      sig { returns(Anthropic::ModelInfo::Lifecycle::TaggedSymbol) }
      attr_accessor :lifecycle

      # The model line this model belongs to, such as `opus` for both Claude Opus 4.5
      # and Claude Opus 4.6. More lines may be added. `null` when the model belongs to
      # no line; do not infer a line from the `id`.
      sig { returns(T.nilable(Anthropic::ModelLine::TaggedSymbol)) }
      attr_accessor :line

      # Maximum input context window size in tokens for this model.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_input_tokens

      # Maximum value for the `max_tokens` parameter when using this model.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_tokens

      # RFC 3339 datetime string representing the model's currently scheduled retirement
      # date. The schedule can be revised until retirement occurs; `null` while the
      # model is `active` or while no retirement is scheduled. A past date on a
      # `deprecated` model means retirement is overdue, not that it has occurred:
      # `lifecycle` is the retirement signal.
      sig { returns(T.nilable(Time)) }
      attr_accessor :retires_at

      # Object type.
      #
      # For Models, this is always `"model"`.
      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          capabilities: T.nilable(Anthropic::ModelCapabilities::OrHash),
          created_at: Time,
          deprecated_at: T.nilable(Time),
          display_name: String,
          lifecycle: Anthropic::ModelInfo::Lifecycle::OrSymbol,
          line: T.nilable(Anthropic::ModelLine::OrSymbol),
          max_input_tokens: T.nilable(Integer),
          max_tokens: T.nilable(Integer),
          retires_at: T.nilable(Time),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique model identifier.
        id:,
        # Object mapping capability names to their support details. Keys are always
        # present for all known capabilities.
        capabilities:,
        # RFC 3339 datetime string representing the time at which the model was released.
        # May be set to an epoch value if the release date is unknown.
        created_at:,
        # RFC 3339 datetime string representing the time of the model's most recent
        # deprecation. Populated for `deprecated` and `retired` models; `null` while the
        # model is `active`.
        deprecated_at:,
        # A human-readable name for the model.
        display_name:,
        # The model's current lifecycle stage.
        #
        # - `active`: The model is available for use, open to new adopters, and not
        #   scheduled for retirement.
        # - `deprecated`: The model remains callable for organizations with existing
        #   access, but is headed for retirement and closed to new adopters.
        # - `retired`: The model is no longer available for use; inference requests naming
        #   it fail. It remains in the catalogue as the historical record of its
        #   retirement.
        lifecycle:,
        # The model line this model belongs to, such as `opus` for both Claude Opus 4.5
        # and Claude Opus 4.6. More lines may be added. `null` when the model belongs to
        # no line; do not infer a line from the `id`.
        line:,
        # Maximum input context window size in tokens for this model.
        max_input_tokens:,
        # Maximum value for the `max_tokens` parameter when using this model.
        max_tokens:,
        # RFC 3339 datetime string representing the model's currently scheduled retirement
        # date. The schedule can be revised until retirement occurs; `null` while the
        # model is `active` or while no retirement is scheduled. A past date on a
        # `deprecated` model means retirement is overdue, not that it has occurred:
        # `lifecycle` is the retirement signal.
        retires_at:,
        # Object type.
        #
        # For Models, this is always `"model"`.
        type: :model
      )
      end

      sig do
        override.returns(
          {
            id: String,
            capabilities: T.nilable(Anthropic::ModelCapabilities),
            created_at: Time,
            deprecated_at: T.nilable(Time),
            display_name: String,
            lifecycle: Anthropic::ModelInfo::Lifecycle::TaggedSymbol,
            line: T.nilable(Anthropic::ModelLine::TaggedSymbol),
            max_input_tokens: T.nilable(Integer),
            max_tokens: T.nilable(Integer),
            retires_at: T.nilable(Time),
            type: Symbol
          }
        )
      end
      def to_hash
      end

      # The model's current lifecycle stage.
      #
      # - `active`: The model is available for use, open to new adopters, and not
      #   scheduled for retirement.
      # - `deprecated`: The model remains callable for organizations with existing
      #   access, but is headed for retirement and closed to new adopters.
      # - `retired`: The model is no longer available for use; inference requests naming
      #   it fail. It remains in the catalogue as the historical record of its
      #   retirement.
      module Lifecycle
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::ModelInfo::Lifecycle) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE = T.let(:active, Anthropic::ModelInfo::Lifecycle::TaggedSymbol)
        DEPRECATED =
          T.let(:deprecated, Anthropic::ModelInfo::Lifecycle::TaggedSymbol)
        RETIRED = T.let(:retired, Anthropic::ModelInfo::Lifecycle::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::ModelInfo::Lifecycle::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
