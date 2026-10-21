# frozen_string_literal: true

module Anthropic
  module Models
    # A limit Anthropic has placed on the entity this profile represents and not yet
    # resolved, discriminated by `type`: `restriction` or `ban`. More types may be
    # added; read a `type` you do not recognize as `restriction`.
    module UserProfileEnforcementAction
      extend Anthropic::Internal::Type::Union

      discriminator :type

      # Anthropic has limited how it serves the end user until the action is resolved. The end user may still be served in part.
      variant :restriction, -> { Anthropic::UserProfileEnforcementActionRestriction }

      # Anthropic has stopped serving the end user where the ban applies and does not plan to serve them there again.
      variant :ban, -> { Anthropic::UserProfileEnforcementActionBan }

      module Type
        extend Anthropic::Internal::Type::Enum

        RESTRICTION = :restriction
        BAN = :ban

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @!method self.variants
      #   @return [Array(Anthropic::Models::UserProfileEnforcementActionRestriction, Anthropic::Models::UserProfileEnforcementActionBan)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::UserProfileEnforcementAction} for more details.
      #
      # @param type [Symbol, Anthropic::Models::UserProfileEnforcementAction::Type, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :id The action's ID (`enac_...`), stable while the action is open.
      #
      #   @option args [Symbol, Anthropic::Models::UserProfileEnforcementActionNextStep, nil] :action The next step on the action: `verify` or `null`. `verify`: the end user can clea
      #
      #   @option args [Time, nil] :expires_at When the action ends on its own, in RFC 3339 format; it stops showing once this
      #
      #   @option args [Time] :opened_at When Anthropic opened the action, in RFC 3339 format.
      #
      #   @option args [Symbol, Anthropic::Models::UserProfileEnforcementActionReason] :reason Why Anthropic placed the limit: `unsupported_region`, `fraud_or_abuse`, `high_ha
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::UserProfileEnforcementActionRestriction, Anthropic::Models::UserProfileEnforcementActionBan]
      def self.new(type:, **args)
        case type.to_sym
        when :restriction
          Anthropic::UserProfileEnforcementActionRestriction.new(**args)
        when :ban
          Anthropic::UserProfileEnforcementActionBan.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
