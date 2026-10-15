# typed: strong

module Anthropic
  module Resources
    class Beta
      class Dreams
        # Start an asynchronous job that uses past sessions to produce a reorganized
        # version of a memory store and get back the dream to poll for the result.
        #
        # By default the dream writes its result to a new memory store and doesn't change
        # the input memory store. The response has `status` set to `pending` and an empty
        # `outputs` array. Poll the dream until `status` is `completed`, `failed`, or
        # `canceled`.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#create-a-dream)
        # to learn more about creating dreams.
        sig do
          params(
            inputs:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaDreamMemoryStoreInput::OrHash,
                  Anthropic::Beta::BetaDreamSessionsInput::OrHash
                )
              ],
            model:
              T.any(Anthropic::Beta::BetaDreamModelConfigParam::OrHash, String),
            instructions: T.nilable(String),
            output_behavior:
              T.any(
                Anthropic::Beta::BetaOutputBehaviorCreateNew::OrHash,
                Anthropic::Beta::BetaOutputBehaviorUpdateExisting::OrHash
              ),
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDream)
        end
        def create(
          # Body param: The memory store and sessions for the dream to read, as exactly one
          # `memory_store` entry and exactly one `sessions` entry.
          inputs:,
          # Body param: The model that runs a dream, given as a model ID or as an object
          # with `id` and `speed`.
          #
          # In the object form, `speed` can only be `standard`.
          #
          # The
          # [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
          # lists the supported models.
          model:,
          # Body param: Guidance that steers how the dream reads the sessions and organizes
          # the output memory store, from 1 to 4,096 characters.
          #
          # See the
          # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#steer-with-instructions)
          # for what kinds of instructions work well.
          instructions: nil,
          # Body param: Which memory store a dream writes its result to. Defaults to
          # `create_new` when left out of a create request.
          output_behavior: nil,
          # Header param: This endpoint is in beta: requests must send `dreaming-2026-04-21`
          # in this header.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Get a dream by ID to check its status, output memory store, and token usage.
        #
        # Archived dreams are returned too.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#track-progress)
        # for how to poll a dream and what each status means.
        sig do
          params(
            dream_id: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDream)
        end
        def retrieve(
          # The ID of the dream to get (`drm_...`).
          dream_id,
          # This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
          # header.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # List the dreams in the workspace, newest first.
        #
        # Archived dreams are left out unless `include_archived` is `true`.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#list-dreams)
        # for how to page through dreams.
        sig do
          params(
            created_at_gt: Time,
            created_at_lt: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            statuses: T::Array[Anthropic::Beta::BetaDreamStatus::OrSymbol],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Internal::PageCursor[Anthropic::Beta::BetaDream])
        end
        def list(
          # Query param: Return only dreams created after this time (exclusive), in
          # RFC 3339.
          created_at_gt: nil,
          # Query param: Return only dreams created before this time (exclusive), in
          # RFC 3339.
          created_at_lt: nil,
          # Query param: Whether to include archived dreams. Defaults to `false`.
          include_archived: nil,
          # Query param: The maximum number of dreams to return, from 1 to 100. Defaults
          # to 20.
          limit: nil,
          # Query param: The cursor for the page to return, taken from `next_page` in a
          # previous response.
          #
          # Leave it out to get the first page.
          page: nil,
          # Query param: Return only dreams that have one of these statuses.
          #
          # Repeat the parameter to give more than one status. Leave it out to return dreams
          # of every status.
          statuses: nil,
          # Header param: This endpoint is in beta: requests must send `dreaming-2026-04-21`
          # in this header.
          betas: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Hide a `completed`, `failed`, or `canceled` dream from the default list of
        # dreams.
        #
        # Archiving a `pending` or `running` dream returns a 400 error, so cancel it
        # first. Archiving an archived dream returns it unchanged. An archived dream can
        # still be fetched by ID. Archiving can't be undone.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#archive-a-dream)
        # to learn more about archiving dreams.
        sig do
          params(
            dream_id: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDream)
        end
        def archive(
          # The ID of the dream to archive (`drm_...`).
          dream_id,
          # This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
          # header.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Stop a `pending` or `running` dream.
        #
        # The response shows `status` as `canceled`, unless the dream reached `completed`
        # or `failed` first. `usage` can keep changing after the response. Canceling a
        # `canceled` dream returns it unchanged. Canceling a `completed` or `failed` dream
        # returns a 400 error.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#cancel-a-dream)
        # to learn more about canceling dreams.
        sig do
          params(
            dream_id: String,
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDream)
        end
        def cancel(
          # The ID of the dream to cancel (`drm_...`).
          dream_id,
          # This endpoint is in beta: requests must send `dreaming-2026-04-21` in this
          # header.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
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
