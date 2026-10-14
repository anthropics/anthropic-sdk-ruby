# frozen_string_literal: true

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
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DreamCreateParams} for more details.
        #
        # @overload create(inputs:, model:, instructions: nil, output_behavior: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param inputs [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>] Body param: The memory store and sessions for the dream to read, as exactly one
        #
        # @param model [Anthropic::Models::Beta::BetaDreamModelConfigParam, String] Body param: The model that runs a dream, given as a model ID or as an object wit
        #
        # @param instructions [String, nil] Body param: Guidance that steers how the dream reads the sessions and organizes
        #
        # @param output_behavior [Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting] Body param: Which memory store a dream writes its result to. Defaults to `create
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaDream]
        #
        # @see Anthropic::Models::Beta::DreamCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::DreamCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
          @client.request(
            span_name: Anthropic::Internal::Tracing::SpanName::DREAMS_CREATE,
            span_created_id: "anthropic.dream.id",
            span_route: "/v1/dreams",
            method: :post,
            path: "v1/dreams?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
          )
        end

        # Get a dream by ID to check its status, output memory store, and token usage.
        #
        # Archived dreams are returned too.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#track-progress)
        # for how to poll a dream and what each status means.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DreamRetrieveParams} for more details.
        #
        # @overload retrieve(dream_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param dream_id [String] The ID of the dream to get (`drm_...`).
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaDream]
        #
        # @see Anthropic::Models::Beta::DreamRetrieveParams
        def retrieve(dream_id, params = {})
          parsed, options = Anthropic::Beta::DreamRetrieveParams.dump_request(params)
          @client.request(
            span_name: Anthropic::Internal::Tracing::SpanName::DREAMS_RETRIEVE,
            span_attributes: {"anthropic.dream.id" => dream_id},
            span_route: "/v1/dreams/{dream_id}",
            method: :get,
            path: ["v1/dreams/%1$s?beta=true", dream_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
          )
        end

        # List the dreams in the workspace, newest first.
        #
        # Archived dreams are left out unless `include_archived` is `true`.
        #
        # See the
        # [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#list-dreams)
        # for how to page through dreams.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DreamListParams} for more details.
        #
        # @overload list(created_at_gt: nil, created_at_lt: nil, include_archived: nil, limit: nil, page: nil, statuses: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param created_at_gt [Time] Query param: Return only dreams created after this time (exclusive), in RFC 3339
        #
        # @param created_at_lt [Time] Query param: Return only dreams created before this time (exclusive), in RFC 333
        #
        # @param include_archived [Boolean] Query param: Whether to include archived dreams. Defaults to `false`.
        #
        # @param limit [Integer] Query param: The maximum number of dreams to return, from 1 to 100. Defaults to
        #
        # @param page [String] Query param: The cursor for the page to return, taken from `next_page` in a prev
        #
        # @param statuses [Array<Symbol, Anthropic::Models::Beta::BetaDreamStatus>] Query param: Return only dreams that have one of these statuses.
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaDream>]
        #
        # @see Anthropic::Models::Beta::DreamListParams
        def list(params = {})
          query_params = [:created_at_gt, :created_at_lt, :include_archived, :limit, :page, :statuses]
          parsed, options = Anthropic::Beta::DreamListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            span_name: Anthropic::Internal::Tracing::SpanName::DREAMS_LIST,
            span_route: "/v1/dreams",
            span_query: %w[created_at[gt] created_at[lt] include_archived limit page statuses],
            method: :get,
            path: "v1/dreams?beta=true",
            query: query.transform_keys(created_at_gt: "created_at[gt]", created_at_lt: "created_at[lt]"),
            headers: parsed.except(*query_params).transform_keys(
              betas: "anthropic-beta",
              workspace_id: "anthropic-workspace-id"
            ),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
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
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DreamArchiveParams} for more details.
        #
        # @overload archive(dream_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param dream_id [String] The ID of the dream to archive (`drm_...`).
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaDream]
        #
        # @see Anthropic::Models::Beta::DreamArchiveParams
        def archive(dream_id, params = {})
          parsed, options = Anthropic::Beta::DreamArchiveParams.dump_request(params)
          @client.request(
            span_name: Anthropic::Internal::Tracing::SpanName::DREAMS_ARCHIVE,
            span_attributes: {"anthropic.dream.id" => dream_id},
            span_route: "/v1/dreams/{dream_id}/archive",
            method: :post,
            path: ["v1/dreams/%1$s/archive?beta=true", dream_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
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
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DreamCancelParams} for more details.
        #
        # @overload cancel(dream_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param dream_id [String] The ID of the dream to cancel (`drm_...`).
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaDream]
        #
        # @see Anthropic::Models::Beta::DreamCancelParams
        def cancel(dream_id, params = {})
          parsed, options = Anthropic::Beta::DreamCancelParams.dump_request(params)
          @client.request(
            span_name: Anthropic::Internal::Tracing::SpanName::DREAMS_CANCEL,
            span_attributes: {"anthropic.dream.id" => dream_id},
            span_route: "/v1/dreams/{dream_id}/cancel",
            method: :post,
            path: ["v1/dreams/%1$s/cancel?beta=true", dream_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
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
