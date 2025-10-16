# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Skills
        class Versions
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionCreateParams} for more details.
          #
          # Create Skill Version
          #
          # @overload create(skill_id, files: nil, betas: nil, request_options: {})
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>, nil] Body param: Files to upload for the skill.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Skills::VersionCreateResponse]
          #
          # @see Anthropic::Models::Beta::Skills::VersionCreateParams
          def create(skill_id, params = {})
            parsed, options = Anthropic::Beta::Skills::VersionCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
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
              model: Anthropic::Models::Beta::Skills::VersionCreateResponse,
              options: {extra_headers: {"anthropic-beta" => "skills-2025-10-02"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionRetrieveParams} for more details.
          #
          # Get Skill Version
          #
          # @overload retrieve(version, skill_id:, betas: nil, request_options: {})
          #
          # @param version [String] Path param: Version identifier for the skill.
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Skills::VersionRetrieveResponse]
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
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Models::Beta::Skills::VersionRetrieveResponse,
              options: {extra_headers: {"anthropic-beta" => "skills-2025-10-02"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionListParams} for more details.
          #
          # List Skill Versions
          #
          # @overload list(skill_id, limit: nil, page: nil, betas: nil, request_options: {})
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param limit [Integer, nil] Query param: Number of items to return per page.
          #
          # @param page [String, nil] Query param: Optionally set to the `next_page` token from the previous response.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Skills::VersionListResponse>]
          #
          # @see Anthropic::Models::Beta::Skills::VersionListParams
          def list(skill_id, params = {})
            parsed, options = Anthropic::Beta::Skills::VersionListParams.dump_request(params)
            query_params = [:limit, :page]
            @client.request(
              method: :get,
              path: ["v1/skills/%1$s/versions?beta=true", skill_id],
              query: parsed.slice(*query_params),
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Models::Beta::Skills::VersionListResponse,
              options: {extra_headers: {"anthropic-beta" => "skills-2025-10-02"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Skills::VersionDeleteParams} for more details.
          #
          # Delete Skill Version
          #
          # @overload delete(version, skill_id:, betas: nil, request_options: {})
          #
          # @param version [String] Path param: Version identifier for the skill.
          #
          # @param skill_id [String] Path param: Unique identifier for the skill.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Skills::VersionDeleteResponse]
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
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Models::Beta::Skills::VersionDeleteResponse,
              options: {extra_headers: {"anthropic-beta" => "skills-2025-10-02"}, **options}
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
