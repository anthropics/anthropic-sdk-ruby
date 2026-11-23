# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalStorage#create
        class ExternalStorageCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute provider_config
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfigParam, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfigParam]
          required :provider_config,
                   union: -> { Anthropic::Beta::Organization::ExternalStorageCreateParams::ProviderConfig }

          # @!attribute display_name
          #   Human-friendly display name.
          #
          #   @return [String, nil]
          optional :display_name, String, nil?: true

          # @!attribute user_profile_id
          #   The user profile to bind the storage to. It can't be changed later. The storage
          #   can be attached only to Workspaces with this profile, and the bucket's setup
          #   must name the same ID.
          #
          #   @return [String, nil]
          optional :user_profile_id, String, nil?: true

          # @!attribute betas
          #   This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(provider_config:, display_name: nil, user_profile_id: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ExternalStorageCreateParams} for more
          #   details.
          #
          #   @param provider_config [Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfigParam, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfigParam]
          #
          #   @param display_name [String, nil] Human-friendly display name.
          #
          #   @param user_profile_id [String, nil] The user profile to bind the storage to. It can't be changed later. The storage
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          module ProviderConfig
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # An Amazon S3 bucket.
            variant :aws, -> { Anthropic::Beta::Organization::BetaAWSExternalStorageConfigParam }

            # A Google Cloud Storage bucket.
            variant :gcp, -> { Anthropic::Beta::Organization::BetaGCPExternalStorageConfigParam }

            module Type
              extend Anthropic::Internal::Type::Enum

              AWS = :aws
              GCP = :gcp

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfigParam, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfigParam)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ExternalStorageCreateParams::ProviderConfig}
            # for more details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::ExternalStorageCreateParams::ProviderConfig::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :account_id 12-digit ID of the AWS account that owns the bucket.
            #
            #   @option args [String] :bucket_name The bucket's name, without `s3://`: 3 to 63 lower-case letters, digits and hyphe
            #
            #   @option args [String] :region The bucket's AWS region. Activating the storage fails if Anthropic can't use buc
            #
            #   @option args [String] :project_number Project number, not project ID, of the Google Cloud project that holds the bucke
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfigParam, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfigParam]
            def self.new(type:, **args)
              case type.to_sym
              when :aws
                Anthropic::Beta::Organization::BetaAWSExternalStorageConfigParam.new(**args)
              when :gcp
                Anthropic::Beta::Organization::BetaGCPExternalStorageConfigParam.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end
    end
  end
end
