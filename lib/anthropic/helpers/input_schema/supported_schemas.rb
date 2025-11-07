# frozen_string_literal: true

module Anthropic
  module Helpers
    module InputSchema
      module SupportedSchemas
        class << self
          # @api private
          #
          # @param x [Object]
          #
          # @yieldparam [Object]
          private def walk_once(x, &blk)
            seen = Set.new
            rec = ->(x) do
              return unless seen.add?(x)

              blk.call(x)
              case x
              in Hash
                x.each_value(&rec)
              in Array
                x.each(&rec)
              else
              end
            end

            rec.call(x)
          end

          # @api private
          #
          # @param schema [Hash{Symbol=>Object}]
          #
          # @return [String]
          private def describe!(schema, unsupported:)
            [:$defs, :default].each { unsupported.delete(_1) }

            doc = unsupported.delete(:description)
            return if unsupported.empty?

            addendum = unsupported.map { "#{_1}=#{_2.to_json}" }.join(",")
            unsupported.each_key { schema.delete(_1) }

            schema[:description] =
              [
                doc,
                "Please also conform to these set of constraints: #{addendum}"
              ].compact.join("\n")
          end

          # @api private
          #
          # @param schema [Hash{Symbol=>Object}]
          #
          # @return [Hash{Symbol=>Object}]
          def transform_schema!(schema)
            defs = schema[:$defs].to_h

            # rubocop:disable Metrics/BlockLength
            xform = ->(s) do
              case s
              in {type: "string" | ["string", "null"], format: "date-time" | "time" | "date" | "duration" | "email" | "hostname" | "uri" | "ipv4" | "ipv6" | "uuid"} | {type: "array", minItems: 0 | 1}
                # these are the currently supported cases
                next

              in {oneOf: Array => schemas, **rest}
                {anyOf: schemas, **rest}

              in {allOf: Array => schemas}
                derefed = schemas.lazy.grep(Hash).map do
                  ref = _1[:$ref].to_s.delete_prefix("#/$defs/")
                  defs.fetch(ref, _1)
                end
                merged = {}.merge!(*derefed)
                if (doc = xform.call(merged))
                  merged.store(:$ref, true)

                  schemas.reject! do |s|
                    next unless s.is_a?(Hash)
                    s.delete(:description)
                    s.select! { merged.key?(_1) }
                    s.empty?
                  end
                  schemas << {description: doc}
                end
              in {type: "integer" | "number" | "string" | ["integer", "null"] | ["number", "null"] | ["string", "null"], **unsupported}
                describe!(s, unsupported: unsupported.except(:enum))
              in {type: "array",  **unsupported}
                describe!(s, unsupported: unsupported.except(:items))
              in {type: "object", **unsupported}
                unsupported.delete(:additionalProperties) if unsupported[:additionalProperties] == false
                describe!(s, unsupported: unsupported.except(:required, :properties))
              else
              end
            end
            # rubocop:enable Metrics/BlockLength

            walk_once(schema, &xform)
            schema
          end
        end
      end
    end
  end
end
