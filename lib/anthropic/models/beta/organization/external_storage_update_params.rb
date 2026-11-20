# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalStorage#update
        class ExternalStorageUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute external_storage_id
          #   The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #   AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
          #   instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
          #   partition of the bucket's region.
          #
          #   @return [String]
          required :external_storage_id, String

          # @!attribute display_name
          #   Human-friendly display name; null clears it.
          #
          #   @return [String, nil]
          required :display_name, String, nil?: true

          # @!attribute betas
          #   This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(external_storage_id:, display_name:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ExternalStorageUpdateParams} for more
          #   details.
          #
          #   @param external_storage_id [String] The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #
          #   @param display_name [String, nil] Human-friendly display name; null clears it.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
