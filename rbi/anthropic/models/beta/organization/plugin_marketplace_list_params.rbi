# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class PluginMarketplaceListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::PluginMarketplaceListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # For a `read:org_audit` or `read:compliance_org_data` key created for all of a
          # parent organization's linked organizations: a child organization of that parent
          # to read instead of the organization the key was created in, given as the
          # organization's UUID or its `org_`-prefixed ID. A value that is neither returns a
          # 400; an organization that is not a child of the key's parent, or where the
          # Plugins API is not available, returns a 404. Any other key may pass only its own
          # organization's ID here; another organization returns a 404.
          sig { returns(T.nilable(String)) }
          attr_accessor :organization_id

          # `organization` for the organization's plugin marketplaces, `user` for members'
          # personal plugin marketplaces.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::PluginMarketplaceListParams::OwnerType::OrSymbol
              )
            )
          end
          attr_accessor :owner_type

          # Optionally set to the `next_page` token from the previous response.
          sig { returns(T.nilable(String)) }
          attr_accessor :page

          # Only plugin marketplaces with this `source`: `manual` for those whose Plugins
          # are uploaded; `github`, `gitlab` or `public_git` for those synchronized from a
          # Git repository. `directory` (Anthropic's catalog) is never listed here.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::OrSymbol
              )
            )
          end
          attr_accessor :source

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
              limit: Integer,
              organization_id: T.nilable(String),
              owner_type:
                T.nilable(
                  Anthropic::Beta::Organization::PluginMarketplaceListParams::OwnerType::OrSymbol
                ),
              page: T.nilable(String),
              source:
                T.nilable(
                  Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::OrSymbol
                ),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            limit: nil,
            # For a `read:org_audit` or `read:compliance_org_data` key created for all of a
            # parent organization's linked organizations: a child organization of that parent
            # to read instead of the organization the key was created in, given as the
            # organization's UUID or its `org_`-prefixed ID. A value that is neither returns a
            # 400; an organization that is not a child of the key's parent, or where the
            # Plugins API is not available, returns a 404. Any other key may pass only its own
            # organization's ID here; another organization returns a 404.
            organization_id: nil,
            # `organization` for the organization's plugin marketplaces, `user` for members'
            # personal plugin marketplaces.
            owner_type: nil,
            # Optionally set to the `next_page` token from the previous response.
            page: nil,
            # Only plugin marketplaces with this `source`: `manual` for those whose Plugins
            # are uploaded; `github`, `gitlab` or `public_git` for those synchronized from a
            # Git repository. `directory` (Anthropic's catalog) is never listed here.
            source: nil,
            # This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this
            # header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                limit: Integer,
                organization_id: T.nilable(String),
                owner_type:
                  T.nilable(
                    Anthropic::Beta::Organization::PluginMarketplaceListParams::OwnerType::OrSymbol
                  ),
                page: T.nilable(String),
                source:
                  T.nilable(
                    Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::OrSymbol
                  ),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # `organization` for the organization's plugin marketplaces, `user` for members'
          # personal plugin marketplaces.
          module OwnerType
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::PluginMarketplaceListParams::OwnerType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ORGANIZATION =
              T.let(
                :organization,
                Anthropic::Beta::Organization::PluginMarketplaceListParams::OwnerType::TaggedSymbol
              )
            USER =
              T.let(
                :user,
                Anthropic::Beta::Organization::PluginMarketplaceListParams::OwnerType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::PluginMarketplaceListParams::OwnerType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Only plugin marketplaces with this `source`: `manual` for those whose Plugins
          # are uploaded; `github`, `gitlab` or `public_git` for those synchronized from a
          # Git repository. `directory` (Anthropic's catalog) is never listed here.
          module Source
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::PluginMarketplaceListParams::Source
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DIRECTORY =
              T.let(
                :directory,
                Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::TaggedSymbol
              )
            GITHUB =
              T.let(
                :github,
                Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::TaggedSymbol
              )
            GITLAB =
              T.let(
                :gitlab,
                Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::TaggedSymbol
              )
            MANUAL =
              T.let(
                :manual,
                Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::TaggedSymbol
              )
            PUBLIC_GIT =
              T.let(
                :public_git,
                Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::PluginMarketplaceListParams::Source::TaggedSymbol
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
