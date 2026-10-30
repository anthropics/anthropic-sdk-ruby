# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          # Who submitted the increase request.
          module BetaSpendLimitIncreaseRequestActor
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
            # {Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor}
            # for more details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestActor::Type, String]
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
