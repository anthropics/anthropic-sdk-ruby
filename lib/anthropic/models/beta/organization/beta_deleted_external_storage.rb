# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalStorage#delete
        class BetaDeletedExternalStorage < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #   AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
          #   instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
          #   partition of the bucket's region.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, :external_storage_deleted]
          required :type, const: :external_storage_deleted

          # @!method initialize(id:, type: :external_storage_deleted)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaDeletedExternalStorage} for more
          #   details.
          #
          #   @param id [String] The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #
          #   @param type [Symbol, :external_storage_deleted]
        end
      end
    end
  end
end
