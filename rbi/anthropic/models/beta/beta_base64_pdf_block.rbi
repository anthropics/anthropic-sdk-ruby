# typed: strong

module Anthropic
  module Models
    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock

    module Beta
      BetaBase64PDFBlock = Anthropic::Models::Beta::BetaRequestDocumentBlock
    end
  end
end
