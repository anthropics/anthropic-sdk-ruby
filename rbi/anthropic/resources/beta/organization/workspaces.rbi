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
              user_profile_id: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
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
            # referenced key. Create key configurations with the External Keys API. On Claude
            # Platform on AWS the value for an AWS KMS key is the key's ARN, and your
            # organization's own key must be a single-Region key in the same AWS account and
            # Region as the Workspace. On that platform the key is validated against this
            # Workspace when it is attached, so a key-policy problem is reported as an error
            # on this request. This field is write-once: once a key is attached to a Workspace
            # it cannot be detached or replaced. To rotate key material, rotate the underlying
            # key on your cloud KMS; the `external_key_id` stays the same.
            external_key_id: nil,
            # Body param: User-defined tags as string key-value pairs. Keys may not begin with
            # `anthropic`.
            tags: nil,
            # Body param: ID of a user profile to attach to the Workspace. Every inference
            # request through the Workspace must then name this user profile; the API rejects
            # a request that names none or a different one. The user profile can't be replaced
            # or removed later; only deleting the user profile clears it.
            user_profile_id: nil,
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
              user_profile_id: String,
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
            # Create key configurations with the External Keys API. On Claude Platform on AWS
            # the value for an AWS KMS key is the key's ARN, and your organization's own key
            # must be a single-Region key in the same AWS account and Region as the Workspace.
            # On that platform the key is validated against this Workspace when it is
            # attached, so a key-policy problem is reported as an error on this request. This
            # field is write-once: once a key is attached to a Workspace it cannot be detached
            # or replaced. To rotate key material, rotate the underlying key on your cloud
            # KMS; the `external_key_id` stays the same.
            external_key_id: nil,
            # Name of the Workspace.
            name: nil,
            # User-defined tags as string key-value pairs. Keys may not begin with
            # `anthropic`.
            tags: nil,
            # ID of a user profile to attach to the Workspace. Every inference request through
            # the Workspace must then name this user profile; the API rejects a request that
            # names none or a different one. Once set, it can't be replaced or removed
            # (sending the same ID again changes nothing); only deleting the user profile
            # clears it. The default Workspace can't have a user profile.
            user_profile_id: nil,
            request_options: {}
          )
          end

          # List Workspaces
          sig do
            params(
              after_id: String,
              before_id: String,
              ids: T::Array[String],
              include_archived: T::Boolean,
              include_default: T::Boolean,
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
            # Only the Workspaces with these IDs, at most 100. `include_archived` and
            # `include_default` still apply, and IDs of Workspaces the caller can't list are
            # left out.
            ids: nil,
            # Whether to include Workspaces that have been archived in the response
            include_archived: nil,
            # Whether to include the organization's default Workspace in the response
            include_default: nil,
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
