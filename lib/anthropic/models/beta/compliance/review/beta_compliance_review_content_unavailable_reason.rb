# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # Why a message's content isn't returned.
          module BetaComplianceReviewContentUnavailableReason
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # No copy of the message was stored.
            variant :not_captured, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentNotCaptured }

            # A copy of the message was stored and can't be returned.
            variant :stored_copy_unavailable,
                    -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable }

            module Type
              extend Anthropic::Internal::Type::Enum

              NOT_CAPTURED = :not_captured
              STORED_COPY_UNAVAILABLE = :stored_copy_unavailable

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewContentNotCaptured, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewContentUnavailableReason::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewContentNotCaptured, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable]
            def self.new(type:, **args)
              case type.to_sym
              when :not_captured
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewContentNotCaptured.new(**args)
              when :stored_copy_unavailable
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewStoredCopyUnavailable.new(**args)
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
