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

        # @!attribute name
        #   If present, replaces the stored name. Omit to leave unchanged. Maximum 255
        #   characters.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute relationship
        #   How the entity behind a user profile relates to the platform that owns the API
        #   key. `external`: an individual end-user of the platform. `resold`: a company the
        #   platform resells Claude access to. `internal`: the platform's own usage.
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileUpdateParams::Relationship, nil]
        optional :relationship,
                 enum: -> {
                   Anthropic::Beta::UserProfileUpdateParams::Relationship
                 },
                 nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(user_profile_id:, external_id: nil, metadata: nil, name: nil, relationship: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::UserProfileUpdateParams} for more details.
        #
        #   @param user_profile_id [String]
        #
        #   @param external_id [String, nil] If present, replaces the stored external_id. Omit to leave unchanged. Maximum 25
        #
        #   @param metadata [Hash{Symbol=>String}] Key-value pairs to merge into the stored metadata. Keys provided overwrite exist
        #
        #   @param name [String, nil] If present, replaces the stored name. Omit to leave unchanged. Maximum 255 chara
        #
        #   @param relationship [Symbol, Anthropic::Models::Beta::UserProfileUpdateParams::Relationship, nil] How the entity behind a user profile relates to the platform that owns the API k
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # How the entity behind a user profile relates to the platform that owns the API
        # key. `external`: an individual end-user of the platform. `resold`: a company the
        # platform resells Claude access to. `internal`: the platform's own usage.
        module Relationship
          extend Anthropic::Internal::Type::Enum

          EXTERNAL = :external
          RESOLD = :resold
          INTERNAL = :internal

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
