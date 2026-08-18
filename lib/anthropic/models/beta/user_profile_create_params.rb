# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#create
      class UserProfileCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute access_type
        #   How the platform uses the API on behalf of the entity this profile represents.
        #   `application`: the platform sells a product that uses the API behind the scenes,
        #   and the profile represents an individual end-user of that product.
        #   `passthrough`: the platform resells raw inference, and the profile identifies
        #   the resold-to company.
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::AccessType, nil]
        optional :access_type, enum: -> { Anthropic::Beta::UserProfileCreateParams::AccessType }

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
        #   Optional for all profiles. Real-world name of the entity this profile represents
        #   (company or individual); for a resold-to company (`relationship` `resold` /
        #   `access_type` `passthrough`), that company's name where known. Maximum 255
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

        # @!method initialize(access_type: nil, external_id: nil, metadata: nil, name: nil, relationship: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::UserProfileCreateParams} for more details.
        #
        #   @param access_type [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::AccessType] How the platform uses the API on behalf of the entity this profile represents. `
        #
        #   @param external_id [String, nil] Platform's own identifier for this user. Not enforced unique. Maximum 255 charac
        #
        #   @param metadata [Hash{Symbol=>String}] Free-form key-value data to attach to this user profile. Maximum 16 keys, with k
        #
        #   @param name [String, nil] Optional for all profiles. Real-world name of the entity this profile represents
        #
        #   @param relationship [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::Relationship] How the entity behind a user profile relates to the platform that owns the API k
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # How the platform uses the API on behalf of the entity this profile represents.
        # `application`: the platform sells a product that uses the API behind the scenes,
        # and the profile represents an individual end-user of that product.
        # `passthrough`: the platform resells raw inference, and the profile identifies
        # the resold-to company.
        module AccessType
          extend Anthropic::Internal::Type::Enum

          APPLICATION = :application
          PASSTHROUGH = :passthrough

          # @!method self.values
          #   @return [Array<Symbol>]
        end

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
