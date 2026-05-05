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

        # @!attribute name
        #   Display name of the entity this profile represents. Required when relationship
        #   is `resold` (the resold-to company's name); optional otherwise. Maximum 255
        #   characters.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute relationship
        #   How the entity behind a user profile relates to the platform that owns the API
        #   key. `external`: an individual end-user of the platform. `resold`: a company the
        #   platform resells Claude access to. `internal`: the platform's own usage.
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::Relationship, nil]
        optional :relationship, enum: -> { Anthropic::Beta::UserProfileCreateParams::Relationship }

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(external_id: nil, metadata: nil, name: nil, relationship: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::UserProfileCreateParams} for more details.
        #
        #   @param external_id [String, nil] Platform's own identifier for this user. Not enforced unique. Maximum 255 charac
        #
        #   @param metadata [Hash{Symbol=>String}] Free-form key-value data to attach to this user profile. Maximum 16 keys, with k
        #
        #   @param name [String, nil] Display name of the entity this profile represents. Required when relationship i
        #
        #   @param relationship [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::Relationship] How the entity behind a user profile relates to the platform that owns the API k
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
