# typed: strong

module Anthropic
  module Helpers
    module Bedrock
      module EventStream
        AWS_CONTENT_TYPE = T.let(%r{^application/vnd\.amazon\.eventstream}, Regexp)

        class << self
          sig { params(chunks: T::Enumerable[String]).returns(T::Enumerable[String]) }
          def to_sse(chunks)
          end

          sig { params(decoder: T.untyped, chunk: T.nilable(String), y: Enumerator::Yielder).void }
          def drain(decoder, chunk, y)
          end

          sig { params(msg: T.untyped, y: Enumerator::Yielder).void }
          def emit(msg, y)
          end
        end
      end
    end
  end
end
