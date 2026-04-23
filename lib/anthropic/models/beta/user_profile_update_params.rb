# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#update
      class UserProfileUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute user_profile_id
        #
        #   @return [String]
        required :user_profile_id, String

        # @!attribute external_id
        #   If present, replaces the stored external_id. Omit to leave unchanged. Maximum
        #   255 characters.
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!attribute metadata
        #   Key-value pairs to merge into the stored metadata. Keys provided overwrite
        #   existing values. To remove a key, set its value to an empty string. Keys not
        #   provided are left unchanged. Maximum 16 keys, with keys up to 64 characters and
        #   values up to 512 characters.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(user_profile_id:, external_id: nil, metadata: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::UserProfileUpdateParams} for more details.
        #
        #   @param user_profile_id [String]
        #
        #   @param external_id [String, nil] If present, replaces the stored external_id. Omit to leave unchanged. Maximum 25
        #
        #   @param metadata [Hash{Symbol=>String}] Key-value pairs to merge into the stored metadata. Keys provided overwrite exist
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
