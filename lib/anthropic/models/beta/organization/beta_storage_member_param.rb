# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaStorageMemberParam
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # No External Storage for this purpose.
          variant :internal, -> { Anthropic::Beta::Organization::BetaInternalStorageParam }

          # The organization's External Storage that `external_storage_id` names.
          variant :external, -> { Anthropic::Beta::Organization::BetaExternalStorageMemberParam }

          module Type
            extend Anthropic::Internal::Type::Enum

            INTERNAL = :internal
            EXTERNAL = :external

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::BetaStorageMemberParam} for more
          # details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaStorageMemberParam::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :external_storage_id The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaInternalStorageParam, Anthropic::Models::Beta::Organization::BetaExternalStorageMemberParam]
          def self.new(type:, **args)
            case type.to_sym
            when :internal
              Anthropic::Beta::Organization::BetaInternalStorageParam.new(**args)
            when :external
              Anthropic::Beta::Organization::BetaExternalStorageMemberParam.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
