# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class PluginListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::PluginListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          sig { returns(T.nilable(Time)) }
          attr_accessor :created_at_gt

          # RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          sig { returns(T.nilable(Time)) }
          attr_accessor :created_at_gte

          # RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          sig { returns(T.nilable(Time)) }
          attr_accessor :created_at_lt

          # RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          sig { returns(T.nilable(Time)) }
          attr_accessor :created_at_lte

          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `100`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Only Plugins in this plugin marketplace (prefixed `marketplace_`).
          sig { returns(T.nilable(String)) }
          attr_accessor :marketplace_id

          # For a `read:org_audit` or `read:compliance_org_data` key created for all of a
          # parent organization's linked organizations: a child organization of that parent
          # to read instead of the organization the key was created in, given as the
          # organization's UUID or its `org_`-prefixed ID. A value that is neither returns a
          # 400; an organization that is not a child of the key's parent, or where the
          # Plugins API is not available, returns a 404. Any other key may pass only its own
          # organization's ID here; another organization returns a 404.
          sig { returns(T.nilable(String)) }
          attr_accessor :organization_id

          # `organization` for Plugins in the organization's plugin marketplaces, `user` for
          # Plugins in members' personal plugin marketplaces.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::PluginListParams::OwnerType::OrSymbol
              )
            )
          end
          attr_accessor :owner_type

          # Only Plugins in this member's personal plugin marketplaces (prefixed `user_`); a
          # removed member's ID is accepted.
          sig { returns(T.nilable(String)) }
          attr_accessor :owner_user_id

          # Optionally set to the `next_page` token from the previous response.
          sig { returns(T.nilable(String)) }
          attr_accessor :page

          # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
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

          sig do
            params(
              created_at_gt: T.nilable(Time),
              created_at_gte: T.nilable(Time),
              created_at_lt: T.nilable(Time),
              created_at_lte: T.nilable(Time),
              limit: Integer,
              marketplace_id: T.nilable(String),
              organization_id: T.nilable(String),
              owner_type:
                T.nilable(
                  Anthropic::Beta::Organization::PluginListParams::OwnerType::OrSymbol
                ),
              owner_user_id: T.nilable(String),
              page: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
            created_at_gt: nil,
            # RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
            created_at_gte: nil,
            # RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
            created_at_lt: nil,
            # RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
            created_at_lte: nil,
            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `100`.
            limit: nil,
            # Only Plugins in this plugin marketplace (prefixed `marketplace_`).
            marketplace_id: nil,
            # For a `read:org_audit` or `read:compliance_org_data` key created for all of a
            # parent organization's linked organizations: a child organization of that parent
            # to read instead of the organization the key was created in, given as the
            # organization's UUID or its `org_`-prefixed ID. A value that is neither returns a
            # 400; an organization that is not a child of the key's parent, or where the
            # Plugins API is not available, returns a 404. Any other key may pass only its own
            # organization's ID here; another organization returns a 404.
            organization_id: nil,
            # `organization` for Plugins in the organization's plugin marketplaces, `user` for
            # Plugins in members' personal plugin marketplaces.
            owner_type: nil,
            # Only Plugins in this member's personal plugin marketplaces (prefixed `user_`); a
            # removed member's ID is accepted.
            owner_user_id: nil,
            # Optionally set to the `next_page` token from the previous response.
            page: nil,
            # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
            # header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                created_at_gt: T.nilable(Time),
                created_at_gte: T.nilable(Time),
                created_at_lt: T.nilable(Time),
                created_at_lte: T.nilable(Time),
                limit: Integer,
                marketplace_id: T.nilable(String),
                organization_id: T.nilable(String),
                owner_type:
                  T.nilable(
                    Anthropic::Beta::Organization::PluginListParams::OwnerType::OrSymbol
                  ),
                owner_user_id: T.nilable(String),
                page: T.nilable(String),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # `organization` for Plugins in the organization's plugin marketplaces, `user` for
          # Plugins in members' personal plugin marketplaces.
          module OwnerType
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::PluginListParams::OwnerType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ORGANIZATION =
              T.let(
                :organization,
                Anthropic::Beta::Organization::PluginListParams::OwnerType::TaggedSymbol
              )
            USER =
              T.let(
                :user,
                Anthropic::Beta::Organization::PluginListParams::OwnerType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::PluginListParams::OwnerType::TaggedSymbol
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
end
