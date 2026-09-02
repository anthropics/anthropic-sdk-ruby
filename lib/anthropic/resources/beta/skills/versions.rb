# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Skills
        class Versions
          # Create Skill Version
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionCreateParams} for more details.
          #
          # @overload create(skill_id, files:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>] Body param: Files to upload for the skill.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Skills::BetaSkillVersion]
          #
          # @see Anthropic::Models::Beta::Skills::VersionCreateParams
          def create(skill_id, params)
            parsed, options = Anthropic::Beta::Skills::VersionCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
            @client.request(
              method: :post,
              path: ["v1/skills/%1$s/versions?beta=true", skill_id],
              headers: {
                "content-type" => "multipart/form-data",
                **parsed.slice(*header_params.keys)
              }.transform_keys(
                header_params
              ),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Skills::BetaSkillVersion,
              options: options
            )
          end

          # Get Skill Version
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionRetrieveParams} for more details.
          #
          # @overload retrieve(version, skill_id:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param version [String] Path param: Identifies the skill version: a version ID, or the literal `latest`
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Skills::BetaSkillVersion]
          #
          # @see Anthropic::Models::Beta::Skills::VersionRetrieveParams
          def retrieve(version, params)
            parsed, options = Anthropic::Beta::Skills::VersionRetrieveParams.dump_request(params)
            skill_id =
              parsed.delete(:skill_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/skills/%1$s/versions/%2$s?beta=true", skill_id, version],
              headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
              model: Anthropic::Beta::Skills::BetaSkillVersion,
              options: options
            )
          end

          # List Skill Versions
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionListParams} for more details.
          #
          # @overload list(skill_id, limit: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param limit [Integer, nil] Query param: Number of results to return per page.
          #
          # @param page [String, nil] Query param: Optionally set to the `next_page` token from the previous response.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Skills::BetaSkillVersion>]
          #
          # @see Anthropic::Models::Beta::Skills::VersionListParams
          def list(skill_id, params = {})
            query_params = [:limit, :page]
            parsed, options = Anthropic::Beta::Skills::VersionListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/skills/%1$s/versions?beta=true", skill_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(
                betas: "anthropic-beta",
                workspace_id: "anthropic-workspace-id"
              ),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Skills::BetaSkillVersion,
              options: options
            )
          end

          # Delete Skill Version
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionDeleteParams} for more details.
          #
          # @overload delete(version, skill_id:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param version [String] Path param: Identifies the skill version by its version ID.
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Skills::BetaDeletedSkillVersion]
          #
          # @see Anthropic::Models::Beta::Skills::VersionDeleteParams
          def delete(version, params)
            parsed, options = Anthropic::Beta::Skills::VersionDeleteParams.dump_request(params)
            skill_id =
              parsed.delete(:skill_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["v1/skills/%1$s/versions/%2$s?beta=true", skill_id, version],
              headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
              model: Anthropic::Beta::Skills::BetaDeletedSkillVersion,
              options: options
            )
          end

          # Download a skill version's content as a zip archive.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionDownloadParams} for more details.
          #
          # @overload download(version, skill_id:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param version [String] Path param: Identifies the skill version by its version ID.
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [StringIO]
          #
          # @see Anthropic::Models::Beta::Skills::VersionDownloadParams
          def download(version, params)
            parsed, options = Anthropic::Beta::Skills::VersionDownloadParams.dump_request(params)
            skill_id =
              parsed.delete(:skill_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/skills/%1$s/versions/%2$s/content?beta=true", skill_id, version],
              headers: {"accept" => "application/binary", **parsed}.transform_keys(
                betas: "anthropic-beta",
                workspace_id: "anthropic-workspace-id"
              ),
              model: StringIO,
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
end
