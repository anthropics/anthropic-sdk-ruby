# typed: strong

module Anthropic
  module Models
    module ErrorDetails
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::AvailableToolsLimitExceededErrorDetails,
            Anthropic::ClaudeCodeKeyCreatorNotMemberErrorDetails,
            Anthropic::ClaudeCodeVersionTooOldErrorDetails,
            Anthropic::CMEKKeyDisabledErrorDetails,
            Anthropic::CMEKKeyNetworkBlockedErrorDetails,
            Anthropic::CompactionBlockAmbiguousErrorDetails,
            Anthropic::CompactionBlockMisplacedErrorDetails,
            Anthropic::CompactionContentMismatchErrorDetails,
            Anthropic::CompactionIncompleteTurnErrorDetails,
            Anthropic::CompactionNothingToSummarizeErrorDetails,
            Anthropic::CompactionSignatureInvalidErrorDetails,
            Anthropic::CompactionTooManyToolReferencesErrorDetails,
            Anthropic::CompactionToolChangesMismatchErrorDetails,
            Anthropic::OrganizationOnHoldErrorDetails,
            Anthropic::RequestBodyEncodingInvalidErrorDetails,
            Anthropic::RequestBodyEncodingUnsupportedErrorDetails,
            Anthropic::ThreadAlreadyContinuedErrorDetails,
            Anthropic::ThreadContinueInFlightErrorDetails,
            Anthropic::ThreadFingerprintMismatchErrorDetails,
            Anthropic::ThreadUnsupportedRequestErrorDetails,
            Anthropic::ToolNameConflictErrorDetails,
            Anthropic::ToolReferenceUnresolvedErrorDetails,
            Anthropic::ThreadNotFoundErrorDetails,
            Anthropic::SkillReadBlockedUndecryptableErrorDetails,
            Anthropic::RequestBodyTooLargeAfterDecodingErrorDetails,
            Anthropic::EnforcedSpendLimitReachedErrorDetails,
            Anthropic::CMEKKeyUnreachableErrorDetails,
            Anthropic::CompactionUnavailableErrorDetails,
            Anthropic::StorageQuotaExceededErrorDetails,
            Anthropic::FileNotDownloadableErrorDetails,
            Anthropic::FileExpiredErrorDetails,
            Anthropic::CMEKContextUnavailableErrorDetails,
            Anthropic::Organization::OrgAPIKeyLimitExceededErrorDetails,
            Anthropic::Organization::WorkspaceAPIKeyLimitExceededErrorDetails,
            Anthropic::UserProfileNotFoundErrorDetails,
            Anthropic::Organization::ExternalKeyInWorkspacePolicyErrorDetails,
            Anthropic::Organization::AlreadyMemberErrorDetails,
            Anthropic::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails,
            Anthropic::Organization::EmailDomainNotAllowedErrorDetails,
            Anthropic::Organization::InviteAlreadyExistsErrorDetails,
            Anthropic::OrgMemberLimitExceededErrorDetails,
            Anthropic::Organization::RBACGroupGrantsOwnerAccessErrorDetails,
            Anthropic::Organization::RBACGroupOwnerAccessUnconfirmedErrorDetails,
            Anthropic::Organization::CannotRemoveLastMemberErrorDetails,
            Anthropic::ConcurrentMembershipChangeErrorDetails,
            Anthropic::Organization::KeyProfileMismatchErrorDetails,
            Anthropic::Organization::WorkspacePolicyViolationErrorDetails,
            Anthropic::Organization::ExternalKeyChangedErrorDetails,
            Anthropic::Organization::WorkspaceMemberLimitExceededErrorDetails,
            Anthropic::OrganizationTypeNotSupportedErrorDetails,
            Anthropic::Beta::BetaEnvironmentCreateDisabledErrorDetails,
            Anthropic::Beta::BetaEnvironmentArchivedErrorDetails,
            Anthropic::Beta::BetaInvalidConfigTypeChangeErrorDetails,
            Anthropic::Beta::BetaEnvironmentUpdateDisabledErrorDetails,
            Anthropic::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails,
            Anthropic::Beta::BetaInvalidMetadataErrorDetails,
            Anthropic::Beta::BetaBillingFrozenErrorDetails,
            Anthropic::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails,
            Anthropic::BetaUnsupportedCharsetErrorDetails,
            Anthropic::Beta::Organization::BetaPluginNameTakenErrorDetails,
            Anthropic::Beta::Organization::BetaSkillNameTakenErrorDetails,
            Anthropic::Beta::Organization::BetaRegistrationPendingErrorDetails,
            Anthropic::Beta::Organization::BetaScanFailedErrorDetails,
            Anthropic::Beta::Organization::BetaScanPendingErrorDetails,
            Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails,
            Anthropic::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails,
            Anthropic::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails,
            Anthropic::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails,
            Anthropic::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails,
            Anthropic::Beta::BetaEnvironmentNotFoundErrorDetails,
            Anthropic::Beta::Organization::BetaSlackChannelSetUpEnvironmentNotFoundErrorDetails,
            Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsConflictErrorDetails
          )
        end

      module ErrorCode
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::ErrorDetails::ErrorCode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AVAILABLE_TOOLS_LIMIT_EXCEEDED =
          T.let(
            :available_tools_limit_exceeded,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CLAUDE_CODE_KEY_CREATOR_NOT_MEMBER =
          T.let(
            :claude_code_key_creator_not_member,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CLAUDE_CODE_VERSION_TOO_OLD =
          T.let(
            :claude_code_version_too_old,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CMEK_KEY_DISABLED =
          T.let(
            :cmek_key_disabled,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CMEK_KEY_NETWORK_BLOCKED =
          T.let(
            :cmek_key_network_blocked,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_BLOCK_AMBIGUOUS =
          T.let(
            :compaction_block_ambiguous,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_BLOCK_MISPLACED =
          T.let(
            :compaction_block_misplaced,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_CONTENT_MISMATCH =
          T.let(
            :compaction_content_mismatch,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_INCOMPLETE_TURN =
          T.let(
            :compaction_incomplete_turn,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_NOTHING_TO_SUMMARIZE =
          T.let(
            :compaction_nothing_to_summarize,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_SIGNATURE_INVALID =
          T.let(
            :compaction_signature_invalid,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_TOO_MANY_TOOL_REFERENCES =
          T.let(
            :compaction_too_many_tool_references,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_TOOL_CHANGES_MISMATCH =
          T.let(
            :compaction_tool_changes_mismatch,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ORGANIZATION_ON_HOLD =
          T.let(
            :organization_on_hold,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        REQUEST_BODY_ENCODING_INVALID =
          T.let(
            :request_body_encoding_invalid,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        REQUEST_BODY_ENCODING_UNSUPPORTED =
          T.let(
            :request_body_encoding_unsupported,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        THREAD_ALREADY_CONTINUED =
          T.let(
            :thread_already_continued,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        THREAD_CONTINUE_IN_FLIGHT =
          T.let(
            :thread_continue_in_flight,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        THREAD_FINGERPRINT_MISMATCH =
          T.let(
            :thread_fingerprint_mismatch,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        THREAD_UNSUPPORTED_REQUEST =
          T.let(
            :thread_unsupported_request,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        TOOL_NAME_CONFLICT =
          T.let(
            :tool_name_conflict,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        TOOL_REFERENCE_UNRESOLVED =
          T.let(
            :tool_reference_unresolved,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        THREAD_NOT_FOUND =
          T.let(
            :thread_not_found,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        SKILL_READ_BLOCKED_UNDECRYPTABLE =
          T.let(
            :skill_read_blocked_undecryptable,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        REQUEST_BODY_TOO_LARGE_AFTER_DECODING =
          T.let(
            :request_body_too_large_after_decoding,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ENFORCED_SPEND_LIMIT_REACHED =
          T.let(
            :enforced_spend_limit_reached,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CMEK_KEY_UNREACHABLE =
          T.let(
            :cmek_key_unreachable,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPACTION_UNAVAILABLE =
          T.let(
            :compaction_unavailable,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        STORAGE_QUOTA_EXCEEDED =
          T.let(
            :storage_quota_exceeded,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        FILE_NOT_DOWNLOADABLE =
          T.let(
            :file_not_downloadable,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        FILE_EXPIRED =
          T.let(:file_expired, Anthropic::ErrorDetails::ErrorCode::TaggedSymbol)
        CMEK_CONTEXT_UNAVAILABLE =
          T.let(
            :cmek_context_unavailable,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ORG_API_KEY_LIMIT_EXCEEDED =
          T.let(
            :org_api_key_limit_exceeded,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        WORKSPACE_API_KEY_LIMIT_EXCEEDED =
          T.let(
            :workspace_api_key_limit_exceeded,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        USER_PROFILE_NOT_FOUND =
          T.let(
            :user_profile_not_found,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        EXTERNAL_KEY_IN_WORKSPACE_POLICY =
          T.let(
            :external_key_in_workspace_policy,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ALREADY_MEMBER =
          T.let(
            :already_member,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CANNOT_INVITE_EMAILS_WITH_UNVERIFIED_DOMAINS =
          T.let(
            :cannot_invite_emails_with_unverified_domains,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        EMAIL_DOMAIN_NOT_ALLOWED =
          T.let(
            :email_domain_not_allowed,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        INVITE_ALREADY_EXISTS =
          T.let(
            :invite_already_exists,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ORG_MEMBER_LIMIT_EXCEEDED =
          T.let(
            :org_member_limit_exceeded,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        RBAC_GROUP_GRANTS_OWNER_ACCESS =
          T.let(
            :rbac_group_grants_owner_access,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        RBAC_GROUP_OWNER_ACCESS_UNCONFIRMED =
          T.let(
            :rbac_group_owner_access_unconfirmed,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CANNOT_REMOVE_LAST_MEMBER =
          T.let(
            :cannot_remove_last_member,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CONCURRENT_MEMBERSHIP_CHANGE =
          T.let(
            :concurrent_membership_change,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        KEY_PROFILE_MISMATCH =
          T.let(
            :key_profile_mismatch,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        WORKSPACE_POLICY_VIOLATION =
          T.let(
            :workspace_policy_violation,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        EXTERNAL_KEY_CHANGED =
          T.let(
            :external_key_changed,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        WORKSPACE_MEMBER_LIMIT_EXCEEDED =
          T.let(
            :workspace_member_limit_exceeded,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ORGANIZATION_TYPE_NOT_SUPPORTED =
          T.let(
            :organization_type_not_supported,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ENVIRONMENT_CREATE_DISABLED =
          T.let(
            :environment_create_disabled,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ENVIRONMENT_ARCHIVED =
          T.let(
            :environment_archived,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        INVALID_CONFIG_TYPE_CHANGE =
          T.let(
            :invalid_config_type_change,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ENVIRONMENT_UPDATE_DISABLED =
          T.let(
            :environment_update_disabled,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        HEARTBEAT_PRECONDITION_FAILED =
          T.let(
            :heartbeat_precondition_failed,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        INVALID_METADATA =
          T.let(
            :invalid_metadata,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        BILLING_FROZEN =
          T.let(
            :billing_frozen,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        SPEND_LIMITS_ADMIN_API_WRITES_NOT_ENABLED =
          T.let(
            :spend_limits_admin_api_writes_not_enabled,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        UNSUPPORTED_CHARSET =
          T.let(
            :unsupported_charset,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        PLUGIN_NAME_TAKEN =
          T.let(
            :plugin_name_taken,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        SKILL_NAME_TAKEN =
          T.let(
            :skill_name_taken,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        REGISTRATION_PENDING =
          T.let(
            :registration_pending,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        SCAN_FAILED =
          T.let(:scan_failed, Anthropic::ErrorDetails::ErrorCode::TaggedSymbol)
        SCAN_PENDING =
          T.let(:scan_pending, Anthropic::ErrorDetails::ErrorCode::TaggedSymbol)
        SLACK_CHANNEL_SET_UP_SETTINGS_REFUSED =
          T.let(
            :slack_channel_set_up_settings_refused,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        API_KEY_SCOPE_MISSING =
          T.let(
            :api_key_scope_missing,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        CLAUDE_TAG_WRITES_NOT_ENABLED =
          T.let(
            :claude_tag_writes_not_enabled,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        COMPLIANCE_CONFIGURATION_RESTRICTED =
          T.let(
            :compliance_configuration_restricted,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ORGANIZATION_LEVEL_SCOPED_API_KEY_REQUIRED =
          T.let(
            :organization_level_scoped_api_key_required,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        ENVIRONMENT_NOT_FOUND =
          T.let(
            :environment_not_found,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        SLACK_CHANNEL_SET_UP_ENVIRONMENT_NOT_FOUND =
          T.let(
            :slack_channel_set_up_environment_not_found,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )
        SLACK_CHANNEL_SET_UP_SETTINGS_CONFLICT =
          T.let(
            :slack_channel_set_up_settings_conflict,
            Anthropic::ErrorDetails::ErrorCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::ErrorDetails::ErrorCode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig { override.returns(T::Array[Anthropic::ErrorDetails::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `error_code` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          error_code: Anthropic::ErrorDetails::ErrorCode::OrSymbol,
          appeal_url: T.nilable(String),
          unsupported:
            T.nilable(
              T::Array[Anthropic::ThreadUnsupportedFeatureName::OrSymbol]
            ),
          field: Anthropic::Organization::WorkspacePolicyField::OrSymbol,
          current_state:
            Anthropic::Beta::Environments::BetaWorkLeaseState::OrHash,
          plugin_id: T.any(T.nilable(String), String),
          skill_name: String,
          plugin_version_id: String,
          slack_channel_id: String
        ).returns(Anthropic::ErrorDetails::Variants)
      end
      def self.new(
        error_code:,
        appeal_url: nil,
        # Each entry names a request field or an organization setting that Threads do not
        # support. On a value you do not recognize, send the full conversation without
        # `thread`.
        unsupported: nil,
        # The request field the broken rule applies to.
        field: nil,
        # The lease as the server holds it.
        current_state: nil,
        plugin_id: nil,
        skill_name: nil,
        plugin_version_id: nil,
        # The identifier of the channel the request set up, starting with `slch_`.
        slack_channel_id: nil
      )
      end
    end
  end
end
