# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          class VersionListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Plugins::VersionListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the Plugin (prefixed `plugin_`).
            sig { returns(String) }
            attr_accessor :plugin_id

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
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                plugin_id: String,
                limit: Integer,
                organization_id: T.nilable(String),
                page: T.nilable(String),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the Plugin (prefixed `plugin_`).
              plugin_id:,
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
                  plugin_id: String,
                  limit: Integer,
                  organization_id: T.nilable(String),
                  page: T.nilable(String),
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
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
  end
end
