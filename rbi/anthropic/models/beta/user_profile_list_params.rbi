# typed: strong

module Anthropic
  module Models
    module Beta
      class UserProfileListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::UserProfileListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The maximum number of user profiles to return, from 1 to 100. Defaults to 20.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # The sort direction, applied to the field that `order_by` selects. Defaults to
        # `desc`.
        sig do
          returns(
            T.nilable(Anthropic::Beta::UserProfileListParams::Order::OrSymbol)
          )
        end
        attr_reader :order

        sig do
          params(
            order: Anthropic::Beta::UserProfileListParams::Order::OrSymbol
          ).void
        end
        attr_writer :order

        # The field to sort user profiles by, in the direction that `order` sets. Defaults
        # to `created_at`.
        sig do
          returns(
            T.nilable(Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol)
          )
        end
        attr_reader :order_by

        sig do
          params(
            order_by: Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol
          ).void
        end
        attr_writer :order_by

        # The cursor for the page to return, taken from `next_page` in a previous
        # response.
        #
        # Leave it out to get the first page.
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

        # Optional header to specify the beta version(s) you want to use.
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
            limit: Integer,
            order: Anthropic::Beta::UserProfileListParams::Order::OrSymbol,
            order_by: Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol,
            page: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The maximum number of user profiles to return, from 1 to 100. Defaults to 20.
          limit: nil,
          # The sort direction, applied to the field that `order_by` selects. Defaults to
          # `desc`.
          order: nil,
          # The field to sort user profiles by, in the direction that `order` sets. Defaults
          # to `created_at`.
          order_by: nil,
          # The cursor for the page to return, taken from `next_page` in a previous
          # response.
          #
          # Leave it out to get the first page.
          page: nil,
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
              limit: Integer,
              order: Anthropic::Beta::UserProfileListParams::Order::OrSymbol,
              order_by:
                Anthropic::Beta::UserProfileListParams::OrderBy::OrSymbol,
              page: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # The sort direction, applied to the field that `order_by` selects. Defaults to
        # `desc`.
        module Order
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::UserProfileListParams::Order)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Oldest first when `order_by` is `created_at`, or names in ascending order when `order_by` is `name`.
          ASC =
            T.let(
              :asc,
              Anthropic::Beta::UserProfileListParams::Order::TaggedSymbol
            )

          # Newest first when `order_by` is `created_at`, or names in descending order when `order_by` is `name`. This is the default.
          DESC =
            T.let(
              :desc,
              Anthropic::Beta::UserProfileListParams::Order::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileListParams::Order::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The field to sort user profiles by, in the direction that `order` sets. Defaults
        # to `created_at`.
        module OrderBy
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::UserProfileListParams::OrderBy)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Sort by when each user profile was created. This is the default.
          CREATED_AT =
            T.let(
              :created_at,
              Anthropic::Beta::UserProfileListParams::OrderBy::TaggedSymbol
            )

          # Sort by `name`, ignoring the case of ASCII letters. Profiles without a name come last in either direction.
          NAME =
            T.let(
              :name,
              Anthropic::Beta::UserProfileListParams::OrderBy::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::UserProfileListParams::OrderBy::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
