# frozen_string_literal: true

module Anthropic
  module Resources
    class Skills
      # @return [Anthropic::Resources::Skills::Versions]
      attr_reader :versions

      # Create Skill
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::SkillCreateParams} for more details.
      #
      # @overload create(files:, display_name: nil, workspace_id: nil, request_options: {})
      #
      # @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>] Body param: Files to upload for the skill.
      #
      # @param display_name [String, nil] Body param: Human-readable, single-line label for the Skill. Maximum 255 charact
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::Skill]
      #
      # @see Anthropic::Models::SkillCreateParams
      def create(params)
        parsed, options = Anthropic::SkillCreateParams.dump_request(params)
        header_params = {workspace_id: "anthropic-workspace-id"}
        @client.request(
          method: :post,
          path: "v1/skills",
          headers: {
            "content-type" => "multipart/form-data",
            **parsed.slice(*header_params.keys)
          }.transform_keys(
            header_params
          ),
          body: parsed.except(*header_params.keys),
          model: Anthropic::Skill,
          options: options
        )
      end

      # Get Skill
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::SkillRetrieveParams} for more details.
      #
      # @overload retrieve(skill_id, workspace_id: nil, request_options: {})
      #
      # @param skill_id [String] Unique identifier for the skill.
      #
      # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::Skill]
      #
      # @see Anthropic::Models::SkillRetrieveParams
      def retrieve(skill_id, params = {})
        parsed, options = Anthropic::SkillRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/skills/%1$s", skill_id],
          headers: parsed.transform_keys(workspace_id: "anthropic-workspace-id"),
          model: Anthropic::Skill,
          options: options
        )
      end

      # List Skills
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::SkillListParams} for more details.
      #
      # @overload list(limit: nil, page: nil, source: nil, workspace_id: nil, request_options: {})
      #
      # @param limit [Integer] Query param: Number of results to return per page.
      #
      # @param page [String, nil] Query param: Pagination token for fetching a specific page of results.
      #
      # @param source [String, nil] Query param: Filter skills by source.
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Skill>]
      #
      # @see Anthropic::Models::SkillListParams
      def list(params = {})
        query_params = [:limit, :page, :source]
        parsed, options = Anthropic::SkillListParams.dump_request(params)
        query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: "v1/skills",
          query: query,
          headers: parsed.except(*query_params).transform_keys(workspace_id: "anthropic-workspace-id"),
          page: Anthropic::Internal::PageCursor,
          model: Anthropic::Skill,
          options: options
        )
      end

      # Delete Skill
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::SkillDeleteParams} for more details.
      #
      # @overload delete(skill_id, workspace_id: nil, request_options: {})
      #
      # @param skill_id [String] Unique identifier for the skill.
      #
      # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::DeletedSkill]
      #
      # @see Anthropic::Models::SkillDeleteParams
      def delete(skill_id, params = {})
        parsed, options = Anthropic::SkillDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v1/skills/%1$s", skill_id],
          headers: parsed.transform_keys(workspace_id: "anthropic-workspace-id"),
          model: Anthropic::DeletedSkill,
          options: options
        )
      end

      # @api private
      #
      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
        @versions = Anthropic::Resources::Skills::Versions.new(client: client)
      end
    end
  end
end
