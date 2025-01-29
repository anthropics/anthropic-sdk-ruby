# typed: strong

module Anthropic
  module Extern
    sig { params(blk: T.proc.void).void }
    def sorbet!(&blk); end
  end
end
