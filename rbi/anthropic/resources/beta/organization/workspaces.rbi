# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Workspaces
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Workspaces::RateLimits
            )
          end
          attr_reader :rate_limits

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Workspaces::Members
            )
          end
          attr_reader :members

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::Workspaces::ServiceAccounts
            )
          end
          attr_reader :service_accounts

          # Create Workspace
          sig do
            params(
              name: String,
              data_residency:
                T.nilable(
                  Anthropic::Beta::Organization::BetaDataResidencyCreateConfig::OrHash
                ),
              display_color: T.nilable(String),
              external_key_id: T.nilable(String),
              tags: T.nilable(T::Hash[Symbol, String]),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaWorkspace)
          end
          def create(
            # Body param: Name of the Workspace.
            name:,
            # Body param: Data residency configuration for the workspace. If omitted, defaults
            # to `workspace_geo: "us"`, `allowed_inference_geos: "unrestricted"`, and
            # `default_inference_geo: "global"`.
            data_residency: nil,
            # Body param: Hex color code representing the Workspace in the Anthropic Console.
            display_color: nil,
            # Body param: ID of the customer-managed encryption key (CMEK) configuration to
            # use for this Workspace. Setting this field requires CMEK to be enabled for your
            # organization. When set, data stored for this Workspace is encrypted with the
            # referenced key. Create key configurations with the External Keys API. This field
            # is write-once: once a key is attached to a Workspace it cannot be detached or
            # replaced. To rotate key material, rotate the underlying key on your cloud KMS;
            # the `external_key_id` stays the same.
            external_key_id: nil,
            # Body param: User-defined tags as string key-value pairs. Keys may not begin with
            # `anthropic`.
            tags: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Get Workspace
          sig do
            params(
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaWorkspace)
          end
          def retrieve(
            # ID of the Workspace.
            workspace_id,
            request_options: {}
          )
          end

          # Update Workspace
          sig do
            params(
              workspace_id: String,
              data_residency:
                T.nilable(
                  Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::OrHash
                ),
              display_color: String,
              external_key_id: String,
              name: String,
              tags: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaWorkspace)
          end
          def update(
            workspace_id,
            # Data residency configuration for the workspace.
            data_residency: nil,
            # Hex color code representing the Workspace in the Anthropic Console.
            display_color: nil,
            # ID of the customer-managed encryption key (CMEK) configuration to use for this
            # Workspace. Setting this field requires CMEK to be enabled for your organization.
            # When set, data stored for this Workspace is encrypted with the referenced key.
            # Create key configurations with the External Keys API. This field is write-once:
            # once a key is attached to a Workspace it cannot be detached or replaced. To
            # rotate key material, rotate the underlying key on your cloud KMS; the
            # `external_key_id` stays the same.
            external_key_id: nil,
            # Name of the Workspace.
            name: nil,
            # User-defined tags as string key-value pairs. Keys may not begin with
            # `anthropic`.
            tags: nil,
            request_options: {}
          )
          end

          # List Workspaces
          sig do
            params(
              after_id: String,
              before_id: String,
              include_archived: T::Boolean,
              limit: Integer,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::Page[
                Anthropic::Beta::Organization::BetaWorkspace
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
            # Whether to include Workspaces that have been archived in the response
            include_archived: nil,
            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            limit: nil,
            request_options: {}
          )
          end

          # Archive Workspace
          sig do
            params(
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaWorkspace)
          end
          def archive(workspace_id, request_options: {})
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
