# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Skills
        # @return [Anthropic::Resources::Beta::Skills::Versions]
        attr_reader :versions

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::SkillCreateParams} for more details.
        #
        # Create Skill
        #
        # @overload create(display_title: nil, files: nil, betas: nil, request_options: {})
        #
        # @param display_title [String, nil] Body param: Display title for the skill.
        #
        # @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>, nil] Body param: Files to upload for the skill.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::SkillCreateResponse]
        #
        # @see Anthropic::Models::Beta::SkillCreateParams
        def create(params = {})
          parsed, options = Anthropic::Beta::SkillCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/skills?beta=true",
            headers: {
              "content-type" => "multipart/form-data",
              **parsed.slice(*header_params.keys)
            }.transform_keys(
              header_params
            ),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Models::Beta::SkillCreateResponse,
            options: {extra_headers: {"anthropic-beta" => "skills-2025-10-02"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::SkillRetrieveParams} for more details.
        #
        # Get Skill
        #
        # @overload retrieve(skill_id, betas: nil, request_options: {})
        #
        # @param skill_id [String] Unique identifier for the skill.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::SkillRetrieveResponse]
        #
        # @see Anthropic::Models::Beta::SkillRetrieveParams
        def retrieve(skill_id, params = {})
          parsed, options = Anthropic::Beta::SkillRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/skills/%1$s?beta=true", skill_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Models::Beta::SkillRetrieveResponse,
            options: {extra_headers: {"anthropic-beta" => "skills-2025-10-02"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::SkillListParams} for more details.
        #
        # List Skills
        #
        # @overload list(limit: nil, page: nil, source: nil, betas: nil, request_options: {})
        #
        # @param limit [Integer] Query param: Number of results to return per page.
        #
        # @param page [String, nil] Query param: Pagination token for fetching a specific page of results.
        #
        # @param source [String, nil] Query param: Filter skills by source.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::SkillListResponse>]
        #
        # @see Anthropic::Models::Beta::SkillListParams
        def list(params = {})
          parsed, options = Anthropic::Beta::SkillListParams.dump_request(params)
          query_params = [:limit, :page, :source]
          @client.request(
            method: :get,
            path: "v1/skills?beta=true",
            query: parsed.slice(*query_params),
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Models::Beta::SkillListResponse,
            options: {extra_headers: {"anthropic-beta" => "skills-2025-10-02"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::SkillDeleteParams} for more details.
        #
        # Delete Skill
        #
        # @overload delete(skill_id, betas: nil, request_options: {})
        #
        # @param skill_id [String] Unique identifier for the skill.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::SkillDeleteResponse]
        #
        # @see Anthropic::Models::Beta::SkillDeleteParams
        def delete(skill_id, params = {})
          parsed, options = Anthropic::Beta::SkillDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/skills/%1$s?beta=true", skill_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Models::Beta::SkillDeleteResponse,
            options: {extra_headers: {"anthropic-beta" => "skills-2025-10-02"}, **options}
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @versions = Anthropic::Resources::Beta::Skills::Versions.new(client: client)
        end
      end
    end
  end
end
