# typed: strong

module Anthropic
  class PooledNetRequester
    RequestShape = T.type_alias do
      {method: Symbol, url: URI::Generic, headers: T::Hash[String, String], body: T.anything, deadline: Float}
    end

    sig { params(url: URI::Generic).returns(Net::HTTP) }
    def self.connect(url)
    end

    sig { params(conn: Net::HTTP, deadline: Float).void }
    def self.calibrate_socket_timeout(conn, deadline)
    end

    sig { params(request: Anthropic::PooledNetRequester::RequestShape).returns(Net::HTTPGenericRequest) }
    def self.build_request(request)
    end

    sig do
      params(url: URI::Generic, blk: T.proc.params(arg0: Net::HTTP, arg1: Enumerator::Yielder).void).void
    end
    private def with_pool(url, &blk)
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
