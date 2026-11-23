# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageMemberParam < Anthropic::Internal::Type::BaseModel
          # @!attribute external_storage_id
          #   The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #   AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
          #   instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
          #   partition of the bucket's region.
          #
          #   @return [String]
          required :external_storage_id, String

          # @!attribute type
          #
          #   @return [Symbol, :external]
          required :type, const: :external

          # @!method initialize(external_storage_id:, type: :external)
          #   The organization's External Storage that `external_storage_id` names.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam} for more
          #   details.
          #
          #   @param external_storage_id [String] The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #
          #   @param type [Symbol, :external]
        end
      end
    end
  end
end
