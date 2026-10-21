# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsFileImageSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of a previously uploaded file.
          sig { returns(String) }
          attr_accessor :file_id

          sig { returns(Symbol) }
          attr_accessor :type

          # Image referenced by file ID.
          sig do
            params(file_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # ID of a previously uploaded file.
            file_id:,
            type: :file
          )
          end

          sig { override.returns({ file_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
