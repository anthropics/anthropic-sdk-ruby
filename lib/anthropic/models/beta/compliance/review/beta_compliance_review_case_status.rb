# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # The status of a review case.
          module BetaComplianceReviewCaseStatus
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Anthropic is waiting for a response to the case.
            variant :open, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOpen }

            # Anthropic has stopped waiting for a response. A closed case stays closed.
            variant :closed, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseClosed }

            module Type
              extend Anthropic::Internal::Type::Enum

              OPEN = :open
              CLOSED = :closed

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseOpen, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseClosed)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseStatus::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseCloseReason] :reason Why the case closed. It doesn't change afterwards.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseOpen, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseClosed]
            def self.new(type:, **args)
              case type.to_sym
              when :open
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOpen.new(**args)
              when :closed
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseClosed.new(**args)
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
