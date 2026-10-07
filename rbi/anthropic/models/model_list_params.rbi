# typed: strong

module Anthropic
  module Models
    class ModelListParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::ModelListParams, Anthropic::Internal::AnyHash)
        end

      # ID of the object to use as a cursor for pagination. When provided, returns the
      # page of results immediately after this object.
      sig { returns(T.nilable(String)) }
      attr_reader :after_id

      sig { params(after_id: String).void }
      attr_writer :after_id

      # ID of the object to use as a cursor for pagination. When provided, returns the
      # page of results immediately before this object.
      sig { returns(T.nilable(String)) }
      attr_reader :before_id

      sig { params(before_id: String).void }
      attr_writer :before_id

      # Filter the list to models in any of the given lifecycle stages (`active`,
      # `deprecated`, or `retired`). Up to 3 values. When omitted, the list contains the
      # `active` and `deprecated` models; `retired` models appear only when `retired` is
      # requested explicitly.
      sig do
        returns(
          T.nilable(T::Array[Anthropic::ModelListParams::Lifecycle::OrSymbol])
        )
      end
      attr_reader :lifecycle

      sig do
        params(
          lifecycle: T::Array[Anthropic::ModelListParams::Lifecycle::OrSymbol]
        ).void
      end
      attr_writer :lifecycle

      # Number of items to return per page.
      #
      # Defaults to `20`. Ranges from `1` to `1000`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Optional header to specify the beta version(s) you want to use.
      sig do
        returns(
          T.nilable(T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)])
        )
      end
      attr_reader :betas

      sig do
        params(
          betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
        ).void
      end
      attr_writer :betas

      # Optional header to select the Workspace for this request. The value is a
      # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
      #
      # Only needed for credentials that can act on more than one Workspace. A
      # credential that belongs to a specific Workspace may omit it; if sent, it must
      # match that Workspace.
      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig do
        params(
          after_id: String,
          before_id: String,
          lifecycle: T::Array[Anthropic::ModelListParams::Lifecycle::OrSymbol],
          limit: Integer,
          betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the object to use as a cursor for pagination. When provided, returns the
        # page of results immediately after this object.
        after_id: nil,
        # ID of the object to use as a cursor for pagination. When provided, returns the
        # page of results immediately before this object.
        before_id: nil,
        # Filter the list to models in any of the given lifecycle stages (`active`,
        # `deprecated`, or `retired`). Up to 3 values. When omitted, the list contains the
        # `active` and `deprecated` models; `retired` models appear only when `retired` is
        # requested explicitly.
        lifecycle: nil,
        # Number of items to return per page.
        #
        # Defaults to `20`. Ranges from `1` to `1000`.
        limit: nil,
        # Optional header to specify the beta version(s) you want to use.
        betas: nil,
        # Optional header to select the Workspace for this request. The value is a
        # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        # Only needed for credentials that can act on more than one Workspace. A
        # credential that belongs to a specific Workspace may omit it; if sent, it must
        # match that Workspace.
        workspace_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            after_id: String,
            before_id: String,
            lifecycle:
              T::Array[Anthropic::ModelListParams::Lifecycle::OrSymbol],
            limit: Integer,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Lifecycle
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::ModelListParams::Lifecycle) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, Anthropic::ModelListParams::Lifecycle::TaggedSymbol)
        DEPRECATED =
          T.let(
            :deprecated,
            Anthropic::ModelListParams::Lifecycle::TaggedSymbol
          )
        RETIRED =
          T.let(:retired, Anthropic::ModelListParams::Lifecycle::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::ModelListParams::Lifecycle::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
