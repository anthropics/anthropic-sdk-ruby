# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaRBACRoleSource
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :built_in, -> { Anthropic::Beta::Organization::BetaRBACRoleSourceBuiltIn }

          variant :custom, -> { Anthropic::Beta::Organization::BetaRBACRoleSourceCustom }

          module Type
            extend Anthropic::Internal::Type::Enum

            BUILT_IN = :built_in
            CUSTOM = :custom

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaRBACRoleSourceBuiltIn, Anthropic::Models::Beta::Organization::BetaRBACRoleSourceCustom)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaRBACRoleSource::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaRBACRoleSourceBuiltIn, Anthropic::Models::Beta::Organization::BetaRBACRoleSourceCustom]
          def self.new(type:, **args)
            case type.to_sym
            when :built_in
              Anthropic::Beta::Organization::BetaRBACRoleSourceBuiltIn.new(**args)
            when :custom
              Anthropic::Beta::Organization::BetaRBACRoleSourceCustom.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
