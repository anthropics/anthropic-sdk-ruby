# frozen_string_literal: true

module Anthropic
  module Resources
    class Skills
      class Versions
        # Create Skill Version
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Skills::VersionCreateParams} for more details.
        #
        # @overload create(skill_id, files:, workspace_id: nil, request_options: {})
        #
        # @param skill_id [String] Path param: Unique identifier for the skill.
        #
        # @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>] Body param: Files to upload for the skill.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Skills::SkillVersion]
        #
        # @see Anthropic::Models::Skills::VersionCreateParams
        def create(skill_id, params)
          parsed, options = Anthropic::Skills::VersionCreateParams.dump_request(params)
          header_params = {workspace_id: "anthropic-workspace-id"}
          @client.request(
            method: :post,
            path: ["v1/skills/%1$s/versions", skill_id],
            headers: {
              "content-type" => "multipart/form-data",
              **parsed.slice(*header_params.keys)
            }.transform_keys(
              header_params
            ),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Skills::SkillVersion,
            options: options
          )
        end

        # Get Skill Version
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Skills::VersionRetrieveParams} for more details.
        #
        # @overload retrieve(version, skill_id:, workspace_id: nil, request_options: {})
        #
        # @param version [String] Path param: Identifies the skill version: a version ID, or the literal `latest`
        #
        # @param skill_id [String] Path param: Unique identifier for the skill.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Skills::SkillVersion]
        #
        # @see Anthropic::Models::Skills::VersionRetrieveParams
        def retrieve(version, params)
          parsed, options = Anthropic::Skills::VersionRetrieveParams.dump_request(params)
          skill_id =
            parsed.delete(:skill_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/skills/%1$s/versions/%2$s", skill_id, version],
            headers: parsed.transform_keys(workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Skills::SkillVersion,
            options: options
          )
        end

        # List Skill Versions
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Skills::VersionListParams} for more details.
        #
        # @overload list(skill_id, limit: nil, page: nil, workspace_id: nil, request_options: {})
        #
        # @param skill_id [String] Path param: Unique identifier for the skill.
        #
        # @param limit [Integer, nil] Query param: Number of results to return per page.
        #
        # @param page [String, nil] Query param: Optionally set to the `next_page` token from the previous response.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Skills::SkillVersion>]
        #
        # @see Anthropic::Models::Skills::VersionListParams
        def list(skill_id, params = {})
          query_params = [:limit, :page]
          parsed, options = Anthropic::Skills::VersionListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: ["v1/skills/%1$s/versions", skill_id],
            query: query,
            headers: parsed.except(*query_params).transform_keys(workspace_id: "anthropic-workspace-id"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Skills::SkillVersion,
            options: options
          )
        end

        # Delete Skill Version
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Skills::VersionDeleteParams} for more details.
        #
        # @overload delete(version, skill_id:, workspace_id: nil, request_options: {})
        #
        # @param version [String] Path param: Identifies the skill version by its version ID.
        #
        # @param skill_id [String] Path param: Unique identifier for the skill.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Skills::DeletedSkillVersion]
        #
        # @see Anthropic::Models::Skills::VersionDeleteParams
        def delete(version, params)
          parsed, options = Anthropic::Skills::VersionDeleteParams.dump_request(params)
          skill_id =
            parsed.delete(:skill_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/skills/%1$s/versions/%2$s", skill_id, version],
            headers: parsed.transform_keys(workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Skills::DeletedSkillVersion,
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
