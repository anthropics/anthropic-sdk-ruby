# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module RBACRoleSource
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :built_in, -> { Anthropic::Organization::RBACRoleSourceBuiltIn }

        variant :custom, -> { Anthropic::Organization::RBACRoleSourceCustom }

        module Type
          extend Anthropic::Internal::Type::Enum

          BUILT_IN = :built_in
          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Organization::RBACRoleSourceBuiltIn, Anthropic::Models::Organization::RBACRoleSourceCustom)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Organization::RBACRoleSource::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Organization::RBACRoleSourceBuiltIn, Anthropic::Models::Organization::RBACRoleSourceCustom]
        def self.new(type:, **args)
          case type.to_sym
          when :built_in
            Anthropic::Organization::RBACRoleSourceBuiltIn.new(**args)
          when :custom
            Anthropic::Organization::RBACRoleSourceCustom.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end
  end
end
