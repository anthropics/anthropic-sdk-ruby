# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          # @see Anthropic::Resources::Beta::Organization::SpendLimits::IncreaseRequests#approve
          class IncreaseRequestApproveResponse < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute actor
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor]
            required :actor,
                     union: -> { Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor }

            # @!attribute created_at
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute period
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod]
            required :period, enum: -> { Anthropic::Beta::Organization::BetaSpendLimitPeriod }

            # @!attribute resolved_at
            #
            #   @return [Time, nil]
            required :resolved_at, Time, nil?: true

            # @!attribute resolved_by
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor, nil]
            required :resolved_by,
                     union: -> { Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy },
                     nil?: true

            # @!attribute spend_limit
            #   A configured spend limit: a cap on metered spend for one scope and period.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaSpendLimit]
            required :spend_limit, -> { Anthropic::Beta::Organization::BetaSpendLimit }

            # @!attribute spend_summary
            #   Per-member effective-limit report row (`GET /spend_limits/effective`).
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaSpendSummary, nil]
            required :spend_summary, -> { Anthropic::Beta::Organization::BetaSpendSummary }, nil?: true

            # @!attribute status
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus]
            required :status,
                     enum: -> { Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus }

            # @!attribute type
            #
            #   @return [Symbol, :spend_limit_increase_request]
            required :type, const: :spend_limit_increase_request

            # @!method initialize(id:, actor:, created_at:, period:, resolved_at:, resolved_by:, spend_limit:, spend_summary:, status:, type: :spend_limit_increase_request)
            #   @param id [String]
            #
            #   @param actor [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor]
            #
            #   @param created_at [Time]
            #
            #   @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod]
            #
            #   @param resolved_at [Time, nil]
            #
            #   @param resolved_by [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor, nil]
            #
            #   @param spend_limit [Anthropic::Models::Beta::Organization::BetaSpendLimit] A configured spend limit: a cap on metered spend for one scope and period.
            #
            #   @param spend_summary [Anthropic::Models::Beta::Organization::BetaSpendSummary, nil] Per-member effective-limit report row (`GET /spend_limits/effective`).
            #
            #   @param status [Symbol, Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus]
            #
            #   @param type [Symbol, :spend_limit_increase_request]

            # @see Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse#actor
            module Actor
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # A user within the organization. `name` and `email_address` are
              # null when the underlying account is unavailable or has been deleted;
              # `deleted` is true only for deleted accounts.
              variant :user_actor, -> { Anthropic::Beta::Organization::BetaSpendLimitUserActor }

              # A scoped Admin API key acting on behalf of the organization.
              variant :scoped_api_key_actor, -> { Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor }

              module Type
                extend Anthropic::Internal::Type::Enum

                USER_ACTOR = :user_actor
                SCOPED_API_KEY_ACTOR = :scoped_api_key_actor

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::Actor::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [Boolean] :deleted True only when the underlying account has been deleted.
              #
              #   @option args [String, nil] :email_address The user's email address. Null when the account is unavailable or has been delet
              #
              #   @option args [String, nil] :name The user's current display name. Null when the account is unavailable, has been
              #
              #   @option args [String] :user_id Tagged ID of the user.
              #
              #   @option args [String] :scoped_api_key_id
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor]
              def self.new(type:, **args)
                case type.to_sym
                when :user_actor
                  Anthropic::Beta::Organization::BetaSpendLimitUserActor.new(**args)
                when :scoped_api_key_actor
                  Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor.new(**args)
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end

            # @see Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse#resolved_by
            module ResolvedBy
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # A user within the organization. `name` and `email_address` are
              # null when the underlying account is unavailable or has been deleted;
              # `deleted` is true only for deleted accounts.
              variant :user_actor, -> { Anthropic::Beta::Organization::BetaSpendLimitUserActor }

              # A scoped Admin API key acting on behalf of the organization.
              variant :scoped_api_key_actor, -> { Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor }

              module Type
                extend Anthropic::Internal::Type::Enum

                USER_ACTOR = :user_actor
                SCOPED_API_KEY_ACTOR = :scoped_api_key_actor

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse::ResolvedBy::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [Boolean] :deleted True only when the underlying account has been deleted.
              #
              #   @option args [String, nil] :email_address The user's email address. Null when the account is unavailable or has been delet
              #
              #   @option args [String, nil] :name The user's current display name. Null when the account is unavailable, has been
              #
              #   @option args [String] :user_id Tagged ID of the user.
              #
              #   @option args [String] :scoped_api_key_id
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::BetaSpendLimitUserActor, Anthropic::Models::Beta::Organization::BetaSpendLimitScopedAPIKeyActor]
              def self.new(type:, **args)
                case type.to_sym
                when :user_actor
                  Anthropic::Beta::Organization::BetaSpendLimitUserActor.new(**args)
                when :scoped_api_key_actor
                  Anthropic::Beta::Organization::BetaSpendLimitScopedAPIKeyActor.new(**args)
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
end
