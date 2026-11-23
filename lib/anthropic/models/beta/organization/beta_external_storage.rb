# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalStorage#create
        class BetaExternalStorage < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #   AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
          #   instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
          #   partition of the bucket's region.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute display_name
          #   Human-friendly display name. Null if none was set.
          #
          #   @return [String, nil]
          required :display_name, String, nil?: true

          # @!attribute provider_config
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfig]
          required :provider_config,
                   union: -> { Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig }

          # @!attribute setup_template_version
          #   The version of Anthropic's setup template whose IAM role names this storage was
          #   found to use at activation. Null if no version was recorded, as for storage not
          #   yet activated or not on S3.
          #
          #   @return [String, nil]
          required :setup_template_version, String, nil?: true

          # @!attribute status
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaPendingConfigurationExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaAvailableExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaActiveExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaDrainingExternalStorageStatus]
          required :status, union: -> { Anthropic::Beta::Organization::BetaExternalStorage::Status }

          # @!attribute type
          #
          #   @return [Symbol, :external_storage]
          required :type, const: :external_storage

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute user_profile_id
          #   The user profile the storage is bound to, or null.
          #
          #   @return [String, nil]
          required :user_profile_id, String, nil?: true

          # @!method initialize(id:, created_at:, display_name:, provider_config:, setup_template_version:, status:, updated_at:, user_profile_id:, type: :external_storage)
          #   A storage bucket in the organization's own cloud account. Anthropic writes
          #   inference data to it from each Workspace it is attached to.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaExternalStorage} for more details.
          #
          #   @param id [String] The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #
          #   @param created_at [Time]
          #
          #   @param display_name [String, nil] Human-friendly display name. Null if none was set.
          #
          #   @param provider_config [Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfig]
          #
          #   @param setup_template_version [String, nil] The version of Anthropic's setup template whose IAM role names this storage was
          #
          #   @param status [Anthropic::Models::Beta::Organization::BetaPendingConfigurationExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaAvailableExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaActiveExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaDrainingExternalStorageStatus]
          #
          #   @param updated_at [Time]
          #
          #   @param user_profile_id [String, nil] The user profile the storage is bound to, or null.
          #
          #   @param type [Symbol, :external_storage]

          # @see Anthropic::Models::Beta::Organization::BetaExternalStorage#provider_config
          module ProviderConfig
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # An Amazon S3 bucket.
            variant :aws, -> { Anthropic::Beta::Organization::BetaAWSExternalStorageConfig }

            # A Google Cloud Storage bucket.
            variant :gcp, -> { Anthropic::Beta::Organization::BetaGCPExternalStorageConfig }

            module Type
              extend Anthropic::Internal::Type::Enum

              AWS = :aws
              GCP = :gcp

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfig)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaExternalStorage::ProviderConfig::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :account_id 12-digit ID of the AWS account that owns the bucket.
            #
            #   @option args [String] :bucket_name The bucket's name, without `s3://`.
            #
            #   @option args [String] :region The bucket's AWS region.
            #
            #   @option args [String] :project_number Number of the Google Cloud project that holds the bucket.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfig]
            def self.new(type:, **args)
              case type.to_sym
              when :aws
                Anthropic::Beta::Organization::BetaAWSExternalStorageConfig.new(**args)
              when :gcp
                Anthropic::Beta::Organization::BetaGCPExternalStorageConfig.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # @see Anthropic::Models::Beta::Organization::BetaExternalStorage#status
          module Status
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # The storage isn't verified yet.
            variant :pending_configuration,
                    -> { Anthropic::Beta::Organization::BetaPendingConfigurationExternalStorageStatus }

            # The storage is verified, no Workspace has it attached, and Anthropic doesn't use
            # the bucket.
            variant :available, -> { Anthropic::Beta::Organization::BetaAvailableExternalStorageStatus }

            # At least one Workspace has the storage attached.
            variant :active, -> { Anthropic::Beta::Organization::BetaActiveExternalStorageStatus }

            # No Workspace has the storage attached. A Workspace can attach it again, unless
            # `removal_started` is true.
            variant :draining, -> { Anthropic::Beta::Organization::BetaDrainingExternalStorageStatus }

            module Type
              extend Anthropic::Internal::Type::Enum

              PENDING_CONFIGURATION = :pending_configuration
              AVAILABLE = :available
              ACTIVE = :active
              DRAINING = :draining

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaPendingConfigurationExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaAvailableExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaActiveExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaDrainingExternalStorageStatus)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::BetaExternalStorage::Status} for more
            # details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaExternalStorage::Status::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [Boolean] :healthy Whether the bucket passed its latest recorded check. It can stay `true` after th
            #
            #   @option args [Time] :last_checked_at When the bucket's latest recorded check ran, in RFC 3339.
            #
            #   @option args [Boolean] :removal_started True once a delete has started removing this storage, which can't be undone. It
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaPendingConfigurationExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaAvailableExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaActiveExternalStorageStatus, Anthropic::Models::Beta::Organization::BetaDrainingExternalStorageStatus]
            def self.new(type:, **args)
              case type.to_sym
              when :pending_configuration
                Anthropic::Beta::Organization::BetaPendingConfigurationExternalStorageStatus.new(**args)
              when :available
                Anthropic::Beta::Organization::BetaAvailableExternalStorageStatus.new(**args)
              when :active
                Anthropic::Beta::Organization::BetaActiveExternalStorageStatus.new(**args)
              when :draining
                Anthropic::Beta::Organization::BetaDrainingExternalStorageStatus.new(**args)
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
