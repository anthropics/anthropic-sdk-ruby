# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class APIKeys
          # Get API Key
          #
          # @overload retrieve(api_key_id, request_options: {})
          #
          # @param api_key_id [String] ID of the API key.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaAPIKey]
          #
          # @see Anthropic::Models::Beta::Organization::APIKeyRetrieveParams
          def retrieve(api_key_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/organizations/api_keys/%1$s?beta=true", api_key_id],
              model: Anthropic::Beta::Organization::BetaAPIKey,
              options: params[:request_options]
            )
          end

          # Update API Key
          #
          # @overload update(api_key_id, name: nil, status: nil, request_options: {})
          #
          # @param api_key_id [String] ID of the API key.
          #
          # @param name [String, nil] Name of the API key.
          #
          # @param status [Symbol, Anthropic::Models::Beta::Organization::APIKeyUpdateParams::Status, nil] Status of the API key.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaAPIKey]
          #
          # @see Anthropic::Models::Beta::Organization::APIKeyUpdateParams
          def update(api_key_id, params = {})
            parsed, options = Anthropic::Beta::Organization::APIKeyUpdateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/organizations/api_keys/%1$s?beta=true", api_key_id],
              body: parsed,
              model: Anthropic::Beta::Organization::BetaAPIKey,
              options: options
            )
          end

          # List API Keys
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::APIKeyListParams} for more details.
          #
          # @overload list(after_id: nil, before_id: nil, created_by_user_id: nil, limit: nil, status: nil, workspace_id: nil, request_options: {})
          #
          # @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          # @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          # @param created_by_user_id [String, nil] Filter by the ID of the User who created the object.
          #
          # @param limit [Integer] Number of items to return per page.
          #
          # @param status [Symbol, Anthropic::Models::Beta::Organization::APIKeyListParams::Status, nil] Filter by API key status.
          #
          # @param workspace_id [String, nil] Filter by Workspace ID.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::Page<Anthropic::Models::Beta::Organization::BetaAPIKey>]
          #
          # @see Anthropic::Models::Beta::Organization::APIKeyListParams
          def list(params = {})
            parsed, options = Anthropic::Beta::Organization::APIKeyListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "v1/organizations/api_keys?beta=true",
              query: query,
              page: Anthropic::Internal::Page,
              model: Anthropic::Beta::Organization::BetaAPIKey,
              options: options
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
