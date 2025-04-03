# typed: strong

module Anthropic
  module Internal
    module Type
      # @api private
      module RequestParameters
        # Options to specify HTTP behaviour for this request.
        sig { returns(T.any(Anthropic::RequestOptions, Anthropic::Internal::Util::AnyHash)) }
        attr_accessor :request_options

        # @api private
        module Converter
          # @api private
          sig { params(params: T.anything).returns([T.anything, Anthropic::Internal::Util::AnyHash]) }
          def dump_request(params)
          end
        end
      end
    end
  end
end
