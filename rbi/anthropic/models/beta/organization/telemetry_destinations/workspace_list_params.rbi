# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module TelemetryDestinations
          class WorkspaceListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::TelemetryDestinations::WorkspaceListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the destination (`tdst_...`).
            sig { returns(String) }
            attr_accessor :destination_id

            # Number of entries to return per page, between 1 and 1,000. Defaults to 20.
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
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                destination_id: String,
                limit: Integer,
                page: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the destination (`tdst_...`).
              destination_id:,
              # Number of entries to return per page, between 1 and 1,000. Defaults to 20.
              limit: nil,
              # Opaque cursor from a previous response's `next_page`. Leave it out to get the
              # first page.
              page: nil,
              # This endpoint is in beta: requests must send `telemetry-destinations-2026-08-11`
              # in this header.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  destination_id: String,
                  limit: Integer,
                  page: String,
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
