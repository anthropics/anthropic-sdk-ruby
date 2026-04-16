# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#create
      class UserProfileCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute external_id
        #   Platform's own identifier for this user. Not enforced unique. Maximum 255
        #   characters.
        #
        #   @return [String, nil]
        optional :external_id, String, nil?: true

        # @!attribute metadata
        #   Free-form key-value data to attach to this user profile. Maximum 16 keys, with
        #   keys up to 64 characters and values up to 512 characters. Values must be
        #   non-empty strings.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(external_id: nil, metadata: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::UserProfileCreateParams} for more details.
        #
        #   @param external_id [String, nil] Platform's own identifier for this user. Not enforced unique. Maximum 255 charac
        #
        #   @param metadata [Hash{Symbol=>String}] Free-form key-value data to attach to this user profile. Maximum 16 keys, with k
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
