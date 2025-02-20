# typed: strong

module Anthropic
  class PooledNetRequester
    RequestShape = T.type_alias do
      {
        method: Symbol,
        url: URI::Generic,
        headers: T::Hash[String, String],
        body: T.anything,
        streaming: T::Boolean,
        max_retries: Integer,
        deadline: Float
      }
    end

    sig { params(url: URI::Generic).returns(Net::HTTP) }
    def self.connect(url)
    end

    sig { params(conn: Net::HTTP, deadline: Float).void }
    private_class_method def self.calibrate_socket_timeout(conn, deadline)
    end

    sig do
      params(
        conn: Net::HTTP,
        req: Net::HTTPGenericRequest,
        deadline: Float,
        blk: T.proc.params(arg0: T.any(Net::HTTPGenericRequest, String)).void
      )
        .void
    end
    def self.transport(conn, req, deadline, &blk)
    end

    sig do
      params(
        url: URI::Generic,
        streaming: T::Boolean,
        blk: T.proc.params(arg0: Net::HTTP, arg1: Enumerator::Yielder).void
      )
        .void
    end
    private def with_pool(url, streaming:, &blk)
    end

    sig do
      params(request: Anthropic::PooledNetRequester::RequestShape)
        .returns([Net::HTTPResponse, T::Enumerable[String]])
    end
    def execute(request)
    end

    sig { void }
    def initialize
    end
  end
end
