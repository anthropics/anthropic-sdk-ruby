# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class TelemetryDestinationListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::TelemetryDestinationListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of destinations to return per page, between 1 and 1,000. Defaults to 20.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque cursor from a previous response's `next_page`. Leave it out to get the
          # first page.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # Return only the destinations that cover at least one of these workspaces
          # (`wrkspc_...`).
          #
          # Send at most 100 IDs, as `workspace_ids[]`. A destination covers a workspace
          # when its `workspaces.type` is `all`, when its `include` list has the workspace,
          # or when its `exclude` list doesn't have it. Destinations in either state can
          # match. An ID that isn't the ID of one of the organization's workspaces doesn't
          # match any destination, not even one whose type is `all`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :workspace_ids

          sig { params(workspace_ids: T::Array[String]).void }
          attr_writer :workspace_ids

          # This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
          # in this header.
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
              page: String,
              workspace_ids: T::Array[String],
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of destinations to return per page, between 1 and 1,000. Defaults to 20.
            limit: nil,
            # Opaque cursor from a previous response's `next_page`. Leave it out to get the
            # first page.
            page: nil,
            # Return only the destinations that cover at least one of these workspaces
            # (`wrkspc_...`).
            #
            # Send at most 100 IDs, as `workspace_ids[]`. A destination covers a workspace
            # when its `workspaces.type` is `all`, when its `include` list has the workspace,
            # or when its `exclude` list doesn't have it. Destinations in either state can
            # match. An ID that isn't the ID of one of the organization's workspaces doesn't
            # match any destination, not even one whose type is `all`.
            workspace_ids: nil,
            # This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
            # in this header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                limit: Integer,
                page: String,
                workspace_ids: T::Array[String],
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
