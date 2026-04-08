# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Resources
          # Get Session Resource
          #
          # @overload retrieve(resource_id, session_id:, betas: nil, request_options: {})
          #
          # @param resource_id [String] Path param: Path parameter resource_id
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceRetrieveParams
          def retrieve(resource_id, params)
            parsed, options = Anthropic::Beta::Sessions::ResourceRetrieveParams.dump_request(params)
            session_id =
              parsed.delete(:session_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/sessions/%1$s/resources/%2$s?beta=true", session_id, resource_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Models::Beta::Sessions::ResourceRetrieveResponse,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceUpdateParams} for more details.
          #
          # Update Session Resource
          #
          # @overload update(resource_id, session_id:, authorization_token:, betas: nil, request_options: {})
          #
          # @param resource_id [String] Path param: Path parameter resource_id
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param authorization_token [String] Body param: New authorization token for the resource. Currently only `github_rep
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceUpdateParams
          def update(resource_id, params)
            parsed, options = Anthropic::Beta::Sessions::ResourceUpdateParams.dump_request(params)
            session_id =
              parsed.delete(:session_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/sessions/%1$s/resources/%2$s?beta=true", session_id, resource_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Models::Beta::Sessions::ResourceUpdateResponse,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceListParams} for more details.
          #
          # List Session Resources
          #
          # @overload list(session_id, limit: nil, page: nil, betas: nil, request_options: {})
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param limit [Integer] Query param: Maximum number of resources to return per page (max 1000). If omitt
          #
          # @param page [String] Query param: Opaque cursor from a previous response's next_page field.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource>]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceListParams
          def list(session_id, params = {})
            query_params = [:limit, :page]
            parsed, options = Anthropic::Beta::Sessions::ResourceListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/sessions/%1$s/resources?beta=true", session_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Sessions::BetaManagedAgentsSessionResource,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Delete Session Resource
          #
          # @overload delete(resource_id, session_id:, betas: nil, request_options: {})
          #
          # @param resource_id [String] Path param: Path parameter resource_id
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsDeleteSessionResource]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceDeleteParams
          def delete(resource_id, params)
            parsed, options = Anthropic::Beta::Sessions::ResourceDeleteParams.dump_request(params)
            session_id =
              parsed.delete(:session_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["v1/sessions/%1$s/resources/%2$s?beta=true", session_id, resource_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Sessions::BetaManagedAgentsDeleteSessionResource,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceAddParams} for more details.
          #
          # Add Session Resource
          #
          # @overload add(session_id, file_id:, type:, mount_path: nil, betas: nil, request_options: {})
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param file_id [String] Body param: ID of a previously uploaded file.
          #
          # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams::Type] Body param
          #
          # @param mount_path [String, nil] Body param: Mount path in the container. Defaults to `/mnt/session/uploads/<file
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource]
          #
          # @see Anthropic::Models::Beta::Sessions::ResourceAddParams
          def add(session_id, params)
            parsed, options = Anthropic::Beta::Sessions::ResourceAddParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/sessions/%1$s/resources?beta=true", session_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Sessions::BetaManagedAgentsFileResource,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
