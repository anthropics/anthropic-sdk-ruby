# typed: strong

module Anthropic
  module Models
    module Beta
      # `metadata` has too many keys, a key or value that is too long, or a reserved
      # key. The message names each problem.
      class BetaInvalidMetadataError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig { returns(Anthropic::Beta::BetaInvalidMetadataErrorDetails) }
        def details
        end
      end
    end
  end
end
