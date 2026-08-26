# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class APIKeys
          # Get API Key
          sig do
            params(
              api_key_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaAPIKey)
          end
          def retrieve(
            # ID of the API key.
            api_key_id,
            request_options: {}
          )
          end

          # Update API Key
          sig do
            params(
              api_key_id: String,
              name: T.nilable(String),
              status:
                T.nilable(
                  Anthropic::Beta::Organization::APIKeyUpdateParams::Status::OrSymbol
                ),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaAPIKey)
          end
          def update(
            # ID of the API key.
            api_key_id,
            # Name of the API key.
            name: nil,
            # Status of the API key.
            status: nil,
            request_options: {}
          )
          end

          # List API Keys
          sig do
            params(
              after_id: String,
              before_id: String,
              created_by_user_id: T.nilable(String),
              limit: Integer,
              status:
                T.nilable(
                  Anthropic::Beta::Organization::APIKeyListParams::Status::OrSymbol
                ),
              workspace_id: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::Page[
                Anthropic::Beta::Organization::BetaAPIKey
              ]
            )
          end
          def list(
            # ID of the object to use as a cursor for pagination. When provided, returns the
            # page of results immediately after this object.
            after_id: nil,
            # ID of the object to use as a cursor for pagination. When provided, returns the
            # page of results immediately before this object.
            before_id: nil,
            # Filter by the ID of the User who created the object.
            created_by_user_id: nil,
            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            limit: nil,
            # Filter by API key status.
            status: nil,
            # Filter by Workspace ID.
            workspace_id: nil,
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
