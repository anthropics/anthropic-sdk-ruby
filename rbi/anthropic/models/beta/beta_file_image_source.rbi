# typed: strong

module Anthropic
  module Models
    BetaFileImageSource = Beta::BetaFileImageSource

    module Beta
      class BetaFileImageSource < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFileImageSource,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :file_id

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(file_id: String, type: Symbol).returns(T.attached_class) }
        def self.new(file_id:, type: :file)
        end

        sig { override.returns({ file_id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
