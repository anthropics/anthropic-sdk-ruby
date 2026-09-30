# typed: strong

module Anthropic
  module Models
    module Organization
      module Workspaces
        class ServiceAccountListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Workspaces::ServiceAccountListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the workspace.
          sig { returns(String) }
          attr_accessor :workspace_id

          # Number of results per page.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque cursor from a previous response's `next_page`.
          sig { returns(T.nilable(String)) }
          attr_accessor :page

          sig do
            params(
              workspace_id: String,
              limit: Integer,
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the workspace.
            workspace_id:,
            # Number of results per page.
            limit: nil,
            # Opaque cursor from a previous response's `next_page`.
            page: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                workspace_id: String,
                limit: Integer,
                page: T.nilable(String),
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
