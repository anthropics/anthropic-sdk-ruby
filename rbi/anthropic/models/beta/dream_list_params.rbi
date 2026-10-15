# typed: strong

module Anthropic
  module Models
    module Beta
      class DreamListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::DreamListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Return only dreams created after this time (exclusive), in RFC 3339.
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gt

        sig { params(created_at_gt: Time).void }
        attr_writer :created_at_gt

        # Return only dreams created before this time (exclusive), in RFC 3339.
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lt

        sig { params(created_at_lt: Time).void }
        attr_writer :created_at_lt

        # Whether to include archived dreams. Defaults to `false`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_archived

        sig { params(include_archived: T::Boolean).void }
        attr_writer :include_archived

        # The maximum number of dreams to return, from 1 to 100. Defaults to 20.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # The cursor for the page to return, taken from `next_page` in a previous
        # response.
        #
        # Leave it out to get the first page.
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

        # Return only dreams that have one of these statuses.
        #
        # Repeat the parameter to give more than one status. Leave it out to return dreams
        # of every status.
        sig do
          returns(
            T.nilable(T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol])
          )
        end
        attr_reader :statuses

        sig do
          params(
            statuses: T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol]
          ).void
        end
        attr_writer :statuses

        # This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
        # header.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            )
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
            created_at_gt: Time,
            created_at_lt: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            statuses: T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Return only dreams created after this time (exclusive), in RFC 3339.
          created_at_gt: nil,
          # Return only dreams created before this time (exclusive), in RFC 3339.
          created_at_lt: nil,
          # Whether to include archived dreams. Defaults to `false`.
          include_archived: nil,
          # The maximum number of dreams to return, from 1 to 100. Defaults to 20.
          limit: nil,
          # The cursor for the page to return, taken from `next_page` in a previous
          # response.
          #
          # Leave it out to get the first page.
          page: nil,
          # Return only dreams that have one of these statuses.
          #
          # Repeat the parameter to give more than one status. Leave it out to return dreams
          # of every status.
          statuses: nil,
          # This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
          # header.
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
              created_at_gt: Time,
              created_at_lt: Time,
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
              statuses: T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol],
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
