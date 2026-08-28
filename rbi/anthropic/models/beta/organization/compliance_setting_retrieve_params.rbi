# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ComplianceSettingRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ComplianceSettingRetrieveParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            params(request_options: Anthropic::RequestOptions::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(request_options: {})
          end

          sig do
            override.returns({ request_options: Anthropic::RequestOptions })
          end
          def to_hash
          end
        end
      end
    end
  end
end
