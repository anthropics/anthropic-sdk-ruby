# frozen_string_literal: true

module Anthropic
  module Models
    module ErrorDetails
      extend Anthropic::Internal::Type::Union

      discriminator :error_code

      # The tools available after a message exceed a limit on their number or their size.
      variant :available_tools_limit_exceeded, -> { Anthropic::AvailableToolsLimitExceededErrorDetails }

      # The API key belongs to the Claude Code workspace, and the user who created it is no longer a member of the organization or of that workspace.
      variant :claude_code_key_creator_not_member, -> { Anthropic::ClaudeCodeKeyCreatorNotMemberErrorDetails }

      # The request comes from a Claude Code version older than the minimum that the requested model or the organization requires. Update Claude Code, then retry.
      variant :claude_code_version_too_old, -> { Anthropic::ClaudeCodeVersionTooOldErrorDetails }

      # The workspace's customer-managed encryption key is disabled or revoked. Re-enable the key, then retry.
      variant :cmek_key_disabled, -> { Anthropic::CmekKeyDisabledErrorDetails }

      # The key management service's network access controls blocked the request to the workspace's customer-managed encryption key. The key itself may be healthy.
      variant :cmek_key_network_blocked, -> { Anthropic::CmekKeyNetworkBlockedErrorDetails }

      # `messages` holds more than one `compaction` block with content. Send only the block the conversation returned last.
      variant :compaction_block_ambiguous, -> { Anthropic::CompactionBlockAmbiguousErrorDetails }

      # The `compaction` block is not the first block of the conversation, or is in a `system` message.
      variant :compaction_block_misplaced, -> { Anthropic::CompactionBlockMisplacedErrorDetails }

      # The `compaction` block's `content` differs from the text its `signature` recorded.
      variant :compaction_content_mismatch, -> { Anthropic::CompactionContentMismatchErrorDetails }

      # The compaction request ends on an `assistant` turn that is not finished.
      variant :compaction_incomplete_turn, -> { Anthropic::CompactionIncompleteTurnErrorDetails }

      # `messages` holds no `user` or `assistant` content to summarize or adopt.
      variant :compaction_nothing_to_summarize, -> { Anthropic::CompactionNothingToSummarizeErrorDetails }

      # The `compaction` block's `signature` does not verify.
      variant :compaction_signature_invalid, -> { Anthropic::CompactionSignatureInvalidErrorDetails }

      # The conversation references more distinct tools than a `compaction` block can record.
      variant :compaction_too_many_tool_references,
              -> { Anthropic::CompactionTooManyToolReferencesErrorDetails }

      # The `compaction` block's `tool_changes` differs from what was returned with the block.
      variant :compaction_tool_changes_mismatch, -> { Anthropic::CompactionToolChangesMismatchErrorDetails }

      # Anthropic has disabled the organization for trust and safety reasons. An organization disabled for any other reason, such as billing, does not get this code. `appeal_url`, when present, is where the organization can appeal.
      variant :organization_on_hold, -> { Anthropic::OrganizationOnHoldErrorDetails }

      # The request body is not valid for its `Content-Encoding`.
      variant :request_body_encoding_invalid, -> { Anthropic::RequestBodyEncodingInvalidErrorDetails }

      # The request's `Content-Encoding` is not supported.
      variant :request_body_encoding_unsupported, -> { Anthropic::RequestBodyEncodingUnsupportedErrorDetails }

      # The response that `previous_message_id` names has already been continued, and each response can be continued only once. Continue from the Thread's most recent response `id`.
      variant :thread_already_continued, -> { Anthropic::ThreadAlreadyContinuedErrorDetails }

      # Another request is still continuing from the same `previous_message_id`. Wait for it to complete and continue from its response `id`, or replay the full conversation with `thread: {"type": "create"}`.
      variant :thread_continue_in_flight, -> { Anthropic::ThreadContinueInFlightErrorDetails }

      # A field that must stay the same across a Thread's turns differs from the value stored with the Thread; the message names each such field. Send the stored values, or replay the full conversation with `thread: {"type": "create"}` to change them.
      variant :thread_fingerprint_mismatch, -> { Anthropic::ThreadFingerprintMismatchErrorDetails }

      # The request combines `thread` with a request field or an organization setting that Threads do not support; `unsupported`, when present, names it. Send the full conversation without `thread`, or change that field.
      variant :thread_unsupported_request, -> { Anthropic::ThreadUnsupportedRequestErrorDetails }

      # A tool made available in `messages` takes a name that an available tool of another kind, or of another MCP server, already holds.
      variant :tool_name_conflict, -> { Anthropic::ToolNameConflictErrorDetails }

      # A tool change or MCP tool listing references a tool or MCP server that is not defined at that position in the conversation.
      variant :tool_reference_unresolved, -> { Anthropic::ToolReferenceUnresolvedErrorDetails }

      # No usable Thread state was found for `previous_message_id`. Replay the full conversation with `thread: {"type": "create"}` to start a new Thread.
      variant :thread_not_found, -> { Anthropic::ThreadNotFoundErrorDetails }

      # A custom skill the request names is stored under an encryption key state the workspace cannot currently decrypt.
      variant :skill_read_blocked_undecryptable, -> { Anthropic::SkillReadBlockedUndecryptableErrorDetails }

      # The compressed request body exceeds the request size limit once decoded.
      variant :request_body_too_large_after_decoding,
              -> { Anthropic::RequestBodyTooLargeAfterDecodingErrorDetails }

      # The organization has crossed the monthly API usage threshold of its API tier.
      variant :enforced_spend_limit_reached, -> { Anthropic::EnforcedSpendLimitReachedErrorDetails }

      # The workspace's customer-managed encryption key could not be reached. Retry the request; if this continues, check that the key is available in your key management service, or contact Anthropic support.
      variant :cmek_key_unreachable, -> { Anthropic::CmekKeyUnreachableErrorDetails }

      # The compaction could not be completed for a transient server reason. Retry the request.
      variant :compaction_unavailable, -> { Anthropic::CompactionUnavailableErrorDetails }

      # The organization's file storage quota is exhausted. Delete files to free up space, then retry the upload.
      variant :storage_quota_exceeded, -> { Anthropic::StorageQuotaExceededErrorDetails }

      # The file has `downloadable: false`. Only files generated by a tool, such as the code execution tool, can be downloaded.
      variant :file_not_downloadable, -> { Anthropic::FileNotDownloadableErrorDetails }

      # The file's `expires_at` has passed, so its content is no longer available.
      variant :file_expired, -> { Anthropic::FileExpiredErrorDetails }

      # The request's workspace encryption context could not be resolved, so the request was refused. Retry in a few minutes.
      variant :cmek_context_unavailable, -> { Anthropic::CmekContextUnavailableErrorDetails }

      # The organization has reached its limit of active API keys.
      variant :org_api_key_limit_exceeded, -> { Anthropic::Organization::OrgAPIKeyLimitExceededErrorDetails }

      # The workspace has reached its limit of active API keys.
      variant :workspace_api_key_limit_exceeded,
              -> { Anthropic::Organization::WorkspaceAPIKeyLimitExceededErrorDetails }

      # The request depends on a user profile that does not exist in the organization or is no longer active. The request either names this user profile by ID, or names a resource, such as an External Key, that is bound to it.
      variant :user_profile_not_found, -> { Anthropic::UserProfileNotFoundErrorDetails }

      # The External Key can't be deleted or reconfigured while the organization's Workspace Policy lists it as an allowed key.
      variant :external_key_in_workspace_policy,
              -> { Anthropic::Organization::ExternalKeyInWorkspacePolicyErrorDetails }

      # The email address already belongs to a user in the organization. The message names the user.
      variant :already_member, -> { Anthropic::Organization::AlreadyMemberErrorDetails }

      # The email address's domain is not one of the verified domains of the organization's parent organization.
      variant :cannot_invite_emails_with_unverified_domains,
              -> { Anthropic::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails }

      # The organization restricts invites to an allowed list of email domains, and the list is empty or does not include the email address's domain.
      variant :email_domain_not_allowed, -> { Anthropic::Organization::EmailDomainNotAllowedErrorDetails }

      # A pending invite already exists for the email address. The message names the invite.
      variant :invite_already_exists, -> { Anthropic::Organization::InviteAlreadyExistsErrorDetails }

      # The organization has reached the member limit that Anthropic set for it. Pending invites count toward the limit.
      variant :org_member_limit_exceeded, -> { Anthropic::Organization::OrgMemberLimitExceededErrorDetails }

      # A role attached to an RBAC Group in the request grants owner access, so this API does not add members to that group (directly or through an invite), remove its members, or delete it. Make the change in the organization's admin settings in Claude.
      variant :rbac_group_grants_owner_access, -> { Anthropic::RBACGroupGrantsOwnerAccessErrorDetails }

      # The API could not finish checking whether an RBAC Group in the request grants owner access (the check reached a fixed limit), so it made no change. Retrying the same request will not help. Make the change in the organization's admin settings in Claude.
      variant :rbac_group_owner_access_unconfirmed,
              -> { Anthropic::RBACGroupOwnerAccessUnconfirmedErrorDetails }

      # The user is the organization's only member. Add another member before removing this one.
      variant :cannot_remove_last_member, -> { Anthropic::Organization::CannotRemoveLastMemberErrorDetails }

      # Another change to the organization's members is in progress. Retry the request once it completes.
      variant :concurrent_membership_change, -> { Anthropic::ConcurrentMembershipChangeErrorDetails }

      # The External Key is bound to a user profile, and the Workspace does not have that user profile. A Workspace can use only a key bound to its own user profile or a key that isn't bound to one.
      variant :key_profile_mismatch, -> { Anthropic::Organization::KeyProfileMismatchErrorDetails }

      # The request breaks the organization's Workspace Policy. The message says which rule it broke; an organization admin can see and change the policy in the Console.
      variant :workspace_policy_violation, -> { Anthropic::Organization::WorkspacePolicyViolationErrorDetails }

      # The external key changed while the request was validating it. Send the request again.
      variant :external_key_changed, -> { Anthropic::Organization::ExternalKeyChangedErrorDetails }

      # The workspace has reached the member limit that Anthropic set for it.
      variant :workspace_member_limit_exceeded,
              -> { Anthropic::Organization::WorkspaceMemberLimitExceededErrorDetails }

      # The endpoint does not support the organization's type. Each endpoint's description says which organization types it supports.
      variant :organization_type_not_supported, -> { Anthropic::OrganizationTypeNotSupportedErrorDetails }

      # Anthropic has turned off creating environments for this organization. Existing environments still work.
      variant :environment_create_disabled, -> { Anthropic::Beta::BetaEnvironmentCreateDisabledErrorDetails }

      # The environment is archived, so it cannot be updated.
      variant :environment_archived, -> { Anthropic::Beta::BetaEnvironmentArchivedErrorDetails }

      # `config.type` differs from the environment's stored type, which cannot change after creation.
      variant :invalid_config_type_change, -> { Anthropic::Beta::BetaInvalidConfigTypeChangeErrorDetails }

      # Anthropic has turned off updating environments for this organization. Existing environments still work as they are.
      variant :environment_update_disabled, -> { Anthropic::Beta::BetaEnvironmentUpdateDisabledErrorDetails }

      # `expected_last_heartbeat` does not match the stored heartbeat, so another worker may hold the lease.
      variant :heartbeat_precondition_failed,
              -> { Anthropic::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails }

      # `metadata` has too many keys, a key or value that is too long, or a reserved key. The message names each problem.
      variant :invalid_metadata, -> { Anthropic::Beta::BetaInvalidMetadataErrorDetails }

      # Anthropic has temporarily disabled billing changes for the user account the credential belongs to. Contact support.
      variant :billing_frozen, -> { Anthropic::Beta::BetaBillingFrozenErrorDetails }

      # The organization cannot retrieve, set or delete spend limits with an Admin API credential.
      variant :spend_limits_admin_api_writes_not_enabled,
              -> { Anthropic::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails }

      # The request's `Content-Type` header names a charset other than UTF-8, ISO-8859-1 or US-ASCII. Send the request with no charset, or with one of these.
      variant :unsupported_charset, -> { Anthropic::Beta::BetaUnsupportedCharsetErrorDetails }

      # The marketplace already holds this name. `plugin_id` is the Plugin that holds it, and can be absent.
      variant :plugin_name_taken, -> { Anthropic::Beta::Organization::BetaPluginNameTakenErrorDetails }

      # One of the Plugin's skills has the name of an organization skill. `skill_name` is that name.
      variant :skill_name_taken, -> { Anthropic::Beta::Organization::BetaSkillNameTakenErrorDetails }

      # The Plugin version was stored but is not yet usable in claude.ai. `plugin_id` and `plugin_version_id` identify what was stored.
      variant :registration_pending, -> { Anthropic::Beta::Organization::BetaRegistrationPendingErrorDetails }

      # The content scan of the version in `plugin_version_id` failed, errored or reached no verdict, so the version cannot be served.
      variant :scan_failed, -> { Anthropic::Beta::Organization::BetaScanFailedErrorDetails }

      # The content scan of the version in `plugin_version_id` is still running. Retry once the scan finishes.
      variant :scan_pending, -> { Anthropic::Beta::Organization::BetaScanPendingErrorDetails }

      # The request set the channel up, and `settings` was then refused. The channel stays set up with every setting unset.
      variant :slack_channel_set_up_settings_refused,
              -> { Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails }

      # The API key lacks the scope the request needs: `read:claude_tag` for a read, `write:claude_tag` for a change.
      variant :api_key_scope_missing, -> { Anthropic::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails }

      # Changes through the Claude Tag API are not enabled for the organization.
      variant :claude_tag_writes_not_enabled,
              -> { Anthropic::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails }

      # The organization's compliance configuration does not let Claude Tag store anything new.
      variant :compliance_configuration_restricted,
              -> { Anthropic::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails }

      # The credential is not a scoped API key that is bound at the organization level.
      variant :organization_level_scoped_api_key_required,
              -> { Anthropic::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails }

      # `settings.environment_id` names no Environment within the organization's reach.
      variant :environment_not_found, -> { Anthropic::Beta::Organization::BetaEnvironmentNotFoundErrorDetails }

      # `settings.environment_id` names no Environment within the organization's reach, and the request had set the channel up by then. The channel stays set up with every setting unset.
      variant :slack_channel_set_up_environment_not_found,
              -> { Anthropic::Beta::Organization::BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails }

      # The request set the channel up, and something else then changed the channel or removed it. Nothing of `settings` was stored.
      variant :slack_channel_set_up_settings_conflict,
              -> { Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsConflictErrorDetails }

      module ErrorCode
        extend Anthropic::Internal::Type::Enum

        AVAILABLE_TOOLS_LIMIT_EXCEEDED = :available_tools_limit_exceeded
        CLAUDE_CODE_KEY_CREATOR_NOT_MEMBER = :claude_code_key_creator_not_member
        CLAUDE_CODE_VERSION_TOO_OLD = :claude_code_version_too_old
        CMEK_KEY_DISABLED = :cmek_key_disabled
        CMEK_KEY_NETWORK_BLOCKED = :cmek_key_network_blocked
        COMPACTION_BLOCK_AMBIGUOUS = :compaction_block_ambiguous
        COMPACTION_BLOCK_MISPLACED = :compaction_block_misplaced
        COMPACTION_CONTENT_MISMATCH = :compaction_content_mismatch
        COMPACTION_INCOMPLETE_TURN = :compaction_incomplete_turn
        COMPACTION_NOTHING_TO_SUMMARIZE = :compaction_nothing_to_summarize
        COMPACTION_SIGNATURE_INVALID = :compaction_signature_invalid
        COMPACTION_TOO_MANY_TOOL_REFERENCES = :compaction_too_many_tool_references
        COMPACTION_TOOL_CHANGES_MISMATCH = :compaction_tool_changes_mismatch
        ORGANIZATION_ON_HOLD = :organization_on_hold
        REQUEST_BODY_ENCODING_INVALID = :request_body_encoding_invalid
        REQUEST_BODY_ENCODING_UNSUPPORTED = :request_body_encoding_unsupported
        THREAD_ALREADY_CONTINUED = :thread_already_continued
        THREAD_CONTINUE_IN_FLIGHT = :thread_continue_in_flight
        THREAD_FINGERPRINT_MISMATCH = :thread_fingerprint_mismatch
        THREAD_UNSUPPORTED_REQUEST = :thread_unsupported_request
        TOOL_NAME_CONFLICT = :tool_name_conflict
        TOOL_REFERENCE_UNRESOLVED = :tool_reference_unresolved
        THREAD_NOT_FOUND = :thread_not_found
        SKILL_READ_BLOCKED_UNDECRYPTABLE = :skill_read_blocked_undecryptable
        REQUEST_BODY_TOO_LARGE_AFTER_DECODING = :request_body_too_large_after_decoding
        ENFORCED_SPEND_LIMIT_REACHED = :enforced_spend_limit_reached
        CMEK_KEY_UNREACHABLE = :cmek_key_unreachable
        COMPACTION_UNAVAILABLE = :compaction_unavailable
        STORAGE_QUOTA_EXCEEDED = :storage_quota_exceeded
        FILE_NOT_DOWNLOADABLE = :file_not_downloadable
        FILE_EXPIRED = :file_expired
        CMEK_CONTEXT_UNAVAILABLE = :cmek_context_unavailable
        ORG_API_KEY_LIMIT_EXCEEDED = :org_api_key_limit_exceeded
        WORKSPACE_API_KEY_LIMIT_EXCEEDED = :workspace_api_key_limit_exceeded
        USER_PROFILE_NOT_FOUND = :user_profile_not_found
        EXTERNAL_KEY_IN_WORKSPACE_POLICY = :external_key_in_workspace_policy
        ALREADY_MEMBER = :already_member
        CANNOT_INVITE_EMAILS_WITH_UNVERIFIED_DOMAINS = :cannot_invite_emails_with_unverified_domains
        EMAIL_DOMAIN_NOT_ALLOWED = :email_domain_not_allowed
        INVITE_ALREADY_EXISTS = :invite_already_exists
        ORG_MEMBER_LIMIT_EXCEEDED = :org_member_limit_exceeded
        RBAC_GROUP_GRANTS_OWNER_ACCESS = :rbac_group_grants_owner_access
        RBAC_GROUP_OWNER_ACCESS_UNCONFIRMED = :rbac_group_owner_access_unconfirmed
        CANNOT_REMOVE_LAST_MEMBER = :cannot_remove_last_member
        CONCURRENT_MEMBERSHIP_CHANGE = :concurrent_membership_change
        KEY_PROFILE_MISMATCH = :key_profile_mismatch
        WORKSPACE_POLICY_VIOLATION = :workspace_policy_violation
        EXTERNAL_KEY_CHANGED = :external_key_changed
        WORKSPACE_MEMBER_LIMIT_EXCEEDED = :workspace_member_limit_exceeded
        ORGANIZATION_TYPE_NOT_SUPPORTED = :organization_type_not_supported
        ENVIRONMENT_CREATE_DISABLED = :environment_create_disabled
        ENVIRONMENT_ARCHIVED = :environment_archived
        INVALID_CONFIG_TYPE_CHANGE = :invalid_config_type_change
        ENVIRONMENT_UPDATE_DISABLED = :environment_update_disabled
        HEARTBEAT_PRECONDITION_FAILED = :heartbeat_precondition_failed
        INVALID_METADATA = :invalid_metadata
        BILLING_FROZEN = :billing_frozen
        SPEND_LIMITS_ADMIN_API_WRITES_NOT_ENABLED = :spend_limits_admin_api_writes_not_enabled
        UNSUPPORTED_CHARSET = :unsupported_charset
        PLUGIN_NAME_TAKEN = :plugin_name_taken
        SKILL_NAME_TAKEN = :skill_name_taken
        REGISTRATION_PENDING = :registration_pending
        SCAN_FAILED = :scan_failed
        SCAN_PENDING = :scan_pending
        SLACK_CHANNEL_SET_UP_SETTINGS_REFUSED = :slack_channel_set_up_settings_refused
        API_KEY_SCOPE_MISSING = :api_key_scope_missing
        CLAUDE_TAG_WRITES_NOT_ENABLED = :claude_tag_writes_not_enabled
        COMPLIANCE_CONFIGURATION_RESTRICTED = :compliance_configuration_restricted
        ORGANIZATION_LEVEL_SCOPED_API_KEY_REQUIRED = :organization_level_scoped_api_key_required
        ENVIRONMENT_NOT_FOUND = :environment_not_found
        SLACK_CHANNEL_SET_UP_ENVIRONMENT_NOT_FOUND = :slack_channel_set_up_environment_not_found
        SLACK_CHANNEL_SET_UP_SETTINGS_CONFLICT = :slack_channel_set_up_settings_conflict

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @!method self.variants
      #   @return [Array(Anthropic::Models::AvailableToolsLimitExceededErrorDetails, Anthropic::Models::ClaudeCodeKeyCreatorNotMemberErrorDetails, Anthropic::Models::ClaudeCodeVersionTooOldErrorDetails, Anthropic::Models::CmekKeyDisabledErrorDetails, Anthropic::Models::CmekKeyNetworkBlockedErrorDetails, Anthropic::Models::CompactionBlockAmbiguousErrorDetails, Anthropic::Models::CompactionBlockMisplacedErrorDetails, Anthropic::Models::CompactionContentMismatchErrorDetails, Anthropic::Models::CompactionIncompleteTurnErrorDetails, Anthropic::Models::CompactionNothingToSummarizeErrorDetails, Anthropic::Models::CompactionSignatureInvalidErrorDetails, Anthropic::Models::CompactionTooManyToolReferencesErrorDetails, Anthropic::Models::CompactionToolChangesMismatchErrorDetails, Anthropic::Models::OrganizationOnHoldErrorDetails, Anthropic::Models::RequestBodyEncodingInvalidErrorDetails, Anthropic::Models::RequestBodyEncodingUnsupportedErrorDetails, Anthropic::Models::ThreadAlreadyContinuedErrorDetails, Anthropic::Models::ThreadContinueInFlightErrorDetails, Anthropic::Models::ThreadFingerprintMismatchErrorDetails, Anthropic::Models::ThreadUnsupportedRequestErrorDetails, Anthropic::Models::ToolNameConflictErrorDetails, Anthropic::Models::ToolReferenceUnresolvedErrorDetails, Anthropic::Models::ThreadNotFoundErrorDetails, Anthropic::Models::SkillReadBlockedUndecryptableErrorDetails, Anthropic::Models::RequestBodyTooLargeAfterDecodingErrorDetails, Anthropic::Models::EnforcedSpendLimitReachedErrorDetails, Anthropic::Models::CmekKeyUnreachableErrorDetails, Anthropic::Models::CompactionUnavailableErrorDetails, Anthropic::Models::StorageQuotaExceededErrorDetails, Anthropic::Models::FileNotDownloadableErrorDetails, Anthropic::Models::FileExpiredErrorDetails, Anthropic::Models::CmekContextUnavailableErrorDetails, Anthropic::Models::Organization::OrgAPIKeyLimitExceededErrorDetails, Anthropic::Models::Organization::WorkspaceAPIKeyLimitExceededErrorDetails, Anthropic::Models::UserProfileNotFoundErrorDetails, Anthropic::Models::Organization::ExternalKeyInWorkspacePolicyErrorDetails, Anthropic::Models::Organization::AlreadyMemberErrorDetails, Anthropic::Models::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails, Anthropic::Models::Organization::EmailDomainNotAllowedErrorDetails, Anthropic::Models::Organization::InviteAlreadyExistsErrorDetails, Anthropic::Models::Organization::OrgMemberLimitExceededErrorDetails, Anthropic::Models::RBACGroupGrantsOwnerAccessErrorDetails, Anthropic::Models::RBACGroupOwnerAccessUnconfirmedErrorDetails, Anthropic::Models::Organization::CannotRemoveLastMemberErrorDetails, Anthropic::Models::ConcurrentMembershipChangeErrorDetails, Anthropic::Models::Organization::KeyProfileMismatchErrorDetails, Anthropic::Models::Organization::WorkspacePolicyViolationErrorDetails, Anthropic::Models::Organization::ExternalKeyChangedErrorDetails, Anthropic::Models::Organization::WorkspaceMemberLimitExceededErrorDetails, Anthropic::Models::OrganizationTypeNotSupportedErrorDetails, Anthropic::Models::Beta::BetaEnvironmentCreateDisabledErrorDetails, Anthropic::Models::Beta::BetaEnvironmentArchivedErrorDetails, Anthropic::Models::Beta::BetaInvalidConfigTypeChangeErrorDetails, Anthropic::Models::Beta::BetaEnvironmentUpdateDisabledErrorDetails, Anthropic::Models::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails, Anthropic::Models::Beta::BetaInvalidMetadataErrorDetails, Anthropic::Models::Beta::BetaBillingFrozenErrorDetails, Anthropic::Models::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails, Anthropic::Models::Beta::BetaUnsupportedCharsetErrorDetails, Anthropic::Models::Beta::Organization::BetaPluginNameTakenErrorDetails, Anthropic::Models::Beta::Organization::BetaSkillNameTakenErrorDetails, Anthropic::Models::Beta::Organization::BetaRegistrationPendingErrorDetails, Anthropic::Models::Beta::Organization::BetaScanFailedErrorDetails, Anthropic::Models::Beta::Organization::BetaScanPendingErrorDetails, Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails, Anthropic::Models::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails, Anthropic::Models::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails, Anthropic::Models::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails, Anthropic::Models::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails, Anthropic::Models::Beta::Organization::BetaEnvironmentNotFoundErrorDetails, Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails, Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpSettingsConflictErrorDetails)]

      # Creates a new instance of the variant class whose `error_code` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::ErrorDetails} for more details.
      #
      # @param error_code [Symbol, Anthropic::Models::ErrorDetails::ErrorCode, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String, nil] :appeal_url
      #
      #   @option args [Array<Symbol, Anthropic::Models::ThreadUnsupportedFeatureName>, nil] :unsupported Each entry names a request field or an organization setting that Threads do not
      #
      #   @option args [Symbol, Anthropic::Models::Organization::WorkspacePolicyField] :field The request field the broken rule applies to.
      #
      #   @option args [Anthropic::Models::Beta::Environments::BetaWorkLeaseState] :current_state The lease as the server holds it.
      #
      #   @option args [String, nil, String] :plugin_id
      #
      #   @option args [String] :skill_name
      #
      #   @option args [String] :plugin_version_id
      #
      #   @option args [String] :slack_channel_id The identifier of the channel the request set up, starting with `slch_`.
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::AvailableToolsLimitExceededErrorDetails, Anthropic::Models::ClaudeCodeKeyCreatorNotMemberErrorDetails, Anthropic::Models::ClaudeCodeVersionTooOldErrorDetails, Anthropic::Models::CmekKeyDisabledErrorDetails, Anthropic::Models::CmekKeyNetworkBlockedErrorDetails, Anthropic::Models::CompactionBlockAmbiguousErrorDetails, Anthropic::Models::CompactionBlockMisplacedErrorDetails, Anthropic::Models::CompactionContentMismatchErrorDetails, Anthropic::Models::CompactionIncompleteTurnErrorDetails, Anthropic::Models::CompactionNothingToSummarizeErrorDetails, Anthropic::Models::CompactionSignatureInvalidErrorDetails, Anthropic::Models::CompactionTooManyToolReferencesErrorDetails, Anthropic::Models::CompactionToolChangesMismatchErrorDetails, Anthropic::Models::OrganizationOnHoldErrorDetails, Anthropic::Models::RequestBodyEncodingInvalidErrorDetails, Anthropic::Models::RequestBodyEncodingUnsupportedErrorDetails, Anthropic::Models::ThreadAlreadyContinuedErrorDetails, Anthropic::Models::ThreadContinueInFlightErrorDetails, Anthropic::Models::ThreadFingerprintMismatchErrorDetails, Anthropic::Models::ThreadUnsupportedRequestErrorDetails, Anthropic::Models::ToolNameConflictErrorDetails, Anthropic::Models::ToolReferenceUnresolvedErrorDetails, Anthropic::Models::ThreadNotFoundErrorDetails, Anthropic::Models::SkillReadBlockedUndecryptableErrorDetails, Anthropic::Models::RequestBodyTooLargeAfterDecodingErrorDetails, Anthropic::Models::EnforcedSpendLimitReachedErrorDetails, Anthropic::Models::CmekKeyUnreachableErrorDetails, Anthropic::Models::CompactionUnavailableErrorDetails, Anthropic::Models::StorageQuotaExceededErrorDetails, Anthropic::Models::FileNotDownloadableErrorDetails, Anthropic::Models::FileExpiredErrorDetails, Anthropic::Models::CmekContextUnavailableErrorDetails, Anthropic::Models::Organization::OrgAPIKeyLimitExceededErrorDetails, Anthropic::Models::Organization::WorkspaceAPIKeyLimitExceededErrorDetails, Anthropic::Models::UserProfileNotFoundErrorDetails, Anthropic::Models::Organization::ExternalKeyInWorkspacePolicyErrorDetails, Anthropic::Models::Organization::AlreadyMemberErrorDetails, Anthropic::Models::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails, Anthropic::Models::Organization::EmailDomainNotAllowedErrorDetails, Anthropic::Models::Organization::InviteAlreadyExistsErrorDetails, Anthropic::Models::Organization::OrgMemberLimitExceededErrorDetails, Anthropic::Models::RBACGroupGrantsOwnerAccessErrorDetails, Anthropic::Models::RBACGroupOwnerAccessUnconfirmedErrorDetails, Anthropic::Models::Organization::CannotRemoveLastMemberErrorDetails, Anthropic::Models::ConcurrentMembershipChangeErrorDetails, Anthropic::Models::Organization::KeyProfileMismatchErrorDetails, Anthropic::Models::Organization::WorkspacePolicyViolationErrorDetails, Anthropic::Models::Organization::ExternalKeyChangedErrorDetails, Anthropic::Models::Organization::WorkspaceMemberLimitExceededErrorDetails, Anthropic::Models::OrganizationTypeNotSupportedErrorDetails, Anthropic::Models::Beta::BetaEnvironmentCreateDisabledErrorDetails, Anthropic::Models::Beta::BetaEnvironmentArchivedErrorDetails, Anthropic::Models::Beta::BetaInvalidConfigTypeChangeErrorDetails, Anthropic::Models::Beta::BetaEnvironmentUpdateDisabledErrorDetails, Anthropic::Models::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails, Anthropic::Models::Beta::BetaInvalidMetadataErrorDetails, Anthropic::Models::Beta::BetaBillingFrozenErrorDetails, Anthropic::Models::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails, Anthropic::Models::Beta::BetaUnsupportedCharsetErrorDetails, Anthropic::Models::Beta::Organization::BetaPluginNameTakenErrorDetails, Anthropic::Models::Beta::Organization::BetaSkillNameTakenErrorDetails, Anthropic::Models::Beta::Organization::BetaRegistrationPendingErrorDetails, Anthropic::Models::Beta::Organization::BetaScanFailedErrorDetails, Anthropic::Models::Beta::Organization::BetaScanPendingErrorDetails, Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails, Anthropic::Models::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails, Anthropic::Models::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails, Anthropic::Models::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails, Anthropic::Models::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails, Anthropic::Models::Beta::Organization::BetaEnvironmentNotFoundErrorDetails, Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails, Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpSettingsConflictErrorDetails]
      def self.new(error_code:, **args)
        case error_code.to_sym
        when :available_tools_limit_exceeded
          Anthropic::AvailableToolsLimitExceededErrorDetails.new(**args)
        when :claude_code_key_creator_not_member
          Anthropic::ClaudeCodeKeyCreatorNotMemberErrorDetails.new(**args)
        when :claude_code_version_too_old
          Anthropic::ClaudeCodeVersionTooOldErrorDetails.new(**args)
        when :cmek_key_disabled
          Anthropic::CmekKeyDisabledErrorDetails.new(**args)
        when :cmek_key_network_blocked
          Anthropic::CmekKeyNetworkBlockedErrorDetails.new(**args)
        when :compaction_block_ambiguous
          Anthropic::CompactionBlockAmbiguousErrorDetails.new(**args)
        when :compaction_block_misplaced
          Anthropic::CompactionBlockMisplacedErrorDetails.new(**args)
        when :compaction_content_mismatch
          Anthropic::CompactionContentMismatchErrorDetails.new(**args)
        when :compaction_incomplete_turn
          Anthropic::CompactionIncompleteTurnErrorDetails.new(**args)
        when :compaction_nothing_to_summarize
          Anthropic::CompactionNothingToSummarizeErrorDetails.new(**args)
        when :compaction_signature_invalid
          Anthropic::CompactionSignatureInvalidErrorDetails.new(**args)
        when :compaction_too_many_tool_references
          Anthropic::CompactionTooManyToolReferencesErrorDetails.new(**args)
        when :compaction_tool_changes_mismatch
          Anthropic::CompactionToolChangesMismatchErrorDetails.new(**args)
        when :organization_on_hold
          Anthropic::OrganizationOnHoldErrorDetails.new(**args)
        when :request_body_encoding_invalid
          Anthropic::RequestBodyEncodingInvalidErrorDetails.new(**args)
        when :request_body_encoding_unsupported
          Anthropic::RequestBodyEncodingUnsupportedErrorDetails.new(**args)
        when :thread_already_continued
          Anthropic::ThreadAlreadyContinuedErrorDetails.new(**args)
        when :thread_continue_in_flight
          Anthropic::ThreadContinueInFlightErrorDetails.new(**args)
        when :thread_fingerprint_mismatch
          Anthropic::ThreadFingerprintMismatchErrorDetails.new(**args)
        when :thread_unsupported_request
          Anthropic::ThreadUnsupportedRequestErrorDetails.new(**args)
        when :tool_name_conflict
          Anthropic::ToolNameConflictErrorDetails.new(**args)
        when :tool_reference_unresolved
          Anthropic::ToolReferenceUnresolvedErrorDetails.new(**args)
        when :thread_not_found
          Anthropic::ThreadNotFoundErrorDetails.new(**args)
        when :skill_read_blocked_undecryptable
          Anthropic::SkillReadBlockedUndecryptableErrorDetails.new(**args)
        when :request_body_too_large_after_decoding
          Anthropic::RequestBodyTooLargeAfterDecodingErrorDetails.new(**args)
        when :enforced_spend_limit_reached
          Anthropic::EnforcedSpendLimitReachedErrorDetails.new(**args)
        when :cmek_key_unreachable
          Anthropic::CmekKeyUnreachableErrorDetails.new(**args)
        when :compaction_unavailable
          Anthropic::CompactionUnavailableErrorDetails.new(**args)
        when :storage_quota_exceeded
          Anthropic::StorageQuotaExceededErrorDetails.new(**args)
        when :file_not_downloadable
          Anthropic::FileNotDownloadableErrorDetails.new(**args)
        when :file_expired
          Anthropic::FileExpiredErrorDetails.new(**args)
        when :cmek_context_unavailable
          Anthropic::CmekContextUnavailableErrorDetails.new(**args)
        when :org_api_key_limit_exceeded
          Anthropic::Organization::OrgAPIKeyLimitExceededErrorDetails.new(**args)
        when :workspace_api_key_limit_exceeded
          Anthropic::Organization::WorkspaceAPIKeyLimitExceededErrorDetails.new(**args)
        when :user_profile_not_found
          Anthropic::UserProfileNotFoundErrorDetails.new(**args)
        when :external_key_in_workspace_policy
          Anthropic::Organization::ExternalKeyInWorkspacePolicyErrorDetails.new(**args)
        when :already_member
          Anthropic::Organization::AlreadyMemberErrorDetails.new(**args)
        when :cannot_invite_emails_with_unverified_domains
          Anthropic::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails.new(**args)
        when :email_domain_not_allowed
          Anthropic::Organization::EmailDomainNotAllowedErrorDetails.new(**args)
        when :invite_already_exists
          Anthropic::Organization::InviteAlreadyExistsErrorDetails.new(**args)
        when :org_member_limit_exceeded
          Anthropic::Organization::OrgMemberLimitExceededErrorDetails.new(**args)
        when :rbac_group_grants_owner_access
          Anthropic::RBACGroupGrantsOwnerAccessErrorDetails.new(**args)
        when :rbac_group_owner_access_unconfirmed
          Anthropic::RBACGroupOwnerAccessUnconfirmedErrorDetails.new(**args)
        when :cannot_remove_last_member
          Anthropic::Organization::CannotRemoveLastMemberErrorDetails.new(**args)
        when :concurrent_membership_change
          Anthropic::ConcurrentMembershipChangeErrorDetails.new(**args)
        when :key_profile_mismatch
          Anthropic::Organization::KeyProfileMismatchErrorDetails.new(**args)
        when :workspace_policy_violation
          Anthropic::Organization::WorkspacePolicyViolationErrorDetails.new(**args)
        when :external_key_changed
          Anthropic::Organization::ExternalKeyChangedErrorDetails.new(**args)
        when :workspace_member_limit_exceeded
          Anthropic::Organization::WorkspaceMemberLimitExceededErrorDetails.new(**args)
        when :organization_type_not_supported
          Anthropic::OrganizationTypeNotSupportedErrorDetails.new(**args)
        when :environment_create_disabled
          Anthropic::Beta::BetaEnvironmentCreateDisabledErrorDetails.new(**args)
        when :environment_archived
          Anthropic::Beta::BetaEnvironmentArchivedErrorDetails.new(**args)
        when :invalid_config_type_change
          Anthropic::Beta::BetaInvalidConfigTypeChangeErrorDetails.new(**args)
        when :environment_update_disabled
          Anthropic::Beta::BetaEnvironmentUpdateDisabledErrorDetails.new(**args)
        when :heartbeat_precondition_failed
          Anthropic::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails.new(**args)
        when :invalid_metadata
          Anthropic::Beta::BetaInvalidMetadataErrorDetails.new(**args)
        when :billing_frozen
          Anthropic::Beta::BetaBillingFrozenErrorDetails.new(**args)
        when :spend_limits_admin_api_writes_not_enabled
          Anthropic::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails.new(**args)
        when :unsupported_charset
          Anthropic::Beta::BetaUnsupportedCharsetErrorDetails.new(**args)
        when :plugin_name_taken
          Anthropic::Beta::Organization::BetaPluginNameTakenErrorDetails.new(**args)
        when :skill_name_taken
          Anthropic::Beta::Organization::BetaSkillNameTakenErrorDetails.new(**args)
        when :registration_pending
          Anthropic::Beta::Organization::BetaRegistrationPendingErrorDetails.new(**args)
        when :scan_failed
          Anthropic::Beta::Organization::BetaScanFailedErrorDetails.new(**args)
        when :scan_pending
          Anthropic::Beta::Organization::BetaScanPendingErrorDetails.new(**args)
        when :slack_channel_set_up_settings_refused
          Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails.new(**args)
        when :api_key_scope_missing
          Anthropic::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails.new(**args)
        when :claude_tag_writes_not_enabled
          Anthropic::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails.new(**args)
        when :compliance_configuration_restricted
          Anthropic::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails.new(**args)
        when :organization_level_scoped_api_key_required
          Anthropic::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails.new(**args)
        when :environment_not_found
          Anthropic::Beta::Organization::BetaEnvironmentNotFoundErrorDetails.new(**args)
        when :slack_channel_set_up_environment_not_found
          Anthropic::Beta::Organization::BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails.new(**args)
        when :slack_channel_set_up_settings_conflict
          Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsConflictErrorDetails.new(**args)
        else
          raise ArgumentError, "unknown error_code: #{error_code}"
        end
      end
    end
  end
end
