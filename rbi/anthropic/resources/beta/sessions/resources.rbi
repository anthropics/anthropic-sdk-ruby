# typed: strong

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Resources
          # Get Session Resource
          sig do
            params(
              resource_id: String,
              session_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Models::Beta::Sessions::ResourceRetrieveResponse::Variants
            )
          end
          def retrieve(
            # Path param: Path parameter resource_id
            resource_id,
            # Path param: Path parameter session_id
            session_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Update Session Resource
          sig do
            params(
              resource_id: String,
              session_id: String,
              authorization_token: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Models::Beta::Sessions::ResourceUpdateResponse::Variants
            )
          end
          def update(
            # Path param: Path parameter resource_id
            resource_id,
            # Path param: Path parameter session_id
            session_id:,
            # Body param: New authorization token for the resource. Currently only
            # `github_repository` resources support token rotation.
            authorization_token:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # List Session Resources
          sig do
            params(
              session_id: String,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource::Variants
              ]
            )
          end
          def list(
            # Path param: Path parameter session_id
            session_id,
            # Query param: Maximum number of resources to return per page (max 1000). If
            # omitted, returns all resources.
            limit: nil,
            # Query param: Opaque cursor from a previous response's next_page field.
            page: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Delete Session Resource
          sig do
            params(
              resource_id: String,
              session_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource
            )
          end
          def delete(
            # Path param: Path parameter resource_id
            resource_id,
            # Path param: Path parameter session_id
            session_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Add Session Resource
          sig do
            params(
              session_id: String,
              file_id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsFileResourceParams::Type::OrSymbol,
              mount_path: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Sessions::BetaManagedAgentsFileResource)
          end
          def add(
            # Path param: Path parameter session_id
            session_id,
            # Body param: ID of a previously uploaded file.
            file_id:,
            # Body param
            type:,
            # Body param: Mount path in the container. Defaults to
            # `/mnt/session/uploads/<file_id>`.
            mount_path: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
