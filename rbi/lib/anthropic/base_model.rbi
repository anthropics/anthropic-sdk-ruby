# typed: strong

module Anthropic
  module Converter
    abstract!

    Input = T.type_alias { T.any(Anthropic::Converter, T::Class[T.anything]) }

    sig { overridable.params(value: T.anything).returns(T.anything) }
    def coerce(value)
    end

    sig { overridable.params(value: T.anything).returns(T.anything) }
    def dump(value)
    end

    sig do
      overridable.params(value: T.anything).returns(
        T.any(
          [T::Boolean, T.anything, NilClass],
          [T::Boolean, T::Boolean, Integer]
        )
      )
    end
    def try_strict_coerce(value)
    end

    sig do
      params(
        spec: T.any(
          {
            const: T.nilable(T.any(NilClass, T::Boolean, Integer, Float, Symbol)),
            enum: T.nilable(T.proc.returns(Anthropic::Converter::Input)),
            union: T.nilable(T.proc.returns(Anthropic::Converter::Input))
          },
          T.proc.returns(Anthropic::Converter::Input),
          Anthropic::Converter::Input
        )
      ).returns(T.proc.returns(T.anything).void)
    end
    def self.type_info(spec)
    end

    sig { params(target: Anthropic::Converter::Input, value: T.anything).returns(T.anything) }
    def self.coerce(target, value)
    end

    sig { params(target: Anthropic::Converter::Input, value: T.anything).returns(T.anything) }
    def self.dump(target, value)
    end

    sig { params(target: Anthropic::Converter::Input, value: T.anything).returns(T.anything) }
    def self.try_strict_coerce(target, value)
    end
  end

  class Unknown
    abstract!

    extend Anthropic::Converter

    sig { params(other: T.anything).returns(T::Boolean) }
    def self.===(other)
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def self.==(other)
    end

    sig { override.params(value: T.anything).returns(T.anything) }
    def self.coerce(value)
    end

    sig { override.params(value: T.anything).returns(T.anything) }
    def self.dump(value)
    end

    sig do
      override.params(value: T.anything).returns(
        T.any(
          [T::Boolean, T.anything, NilClass],
          [T::Boolean, T::Boolean, Integer]
        )
      )
    end
    def self.try_strict_coerce(value)
    end
  end

  class BooleanModel
    abstract!

    extend Anthropic::Converter

    sig { params(other: T.anything).returns(T::Boolean) }
    def self.===(other)
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def self.==(other)
    end

    sig { override.params(value: T.any(T::Boolean, T.anything)).returns(T.any(T::Boolean, T.anything)) }
    def self.coerce(value)
    end

    sig { override.params(value: T.any(T::Boolean, T.anything)).returns(T.any(T::Boolean, T.anything)) }
    def self.dump(value)
    end

    sig do
      override.params(value: T.anything).returns(
        T.any(
          [T::Boolean, T.anything, NilClass],
          [T::Boolean, T::Boolean, Integer]
        )
      )
    end
    def self.try_strict_coerce(value)
    end
  end

  class Enum
    abstract!

    extend Anthropic::Converter

    sig { overridable.returns(T::Array[T.any(NilClass, T::Boolean, Integer, Float, Symbol)]) }
    def self.values
    end

    sig { void }
    private_class_method def self.finalize!
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def self.===(other)
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def self.==(other)
    end

    sig { override.params(value: T.any(String, Symbol, T.anything)).returns(T.any(Symbol, T.anything)) }
    def self.coerce(value)
    end

    sig { override.params(value: T.any(Symbol, T.anything)).returns(T.any(Symbol, T.anything)) }
    def self.dump(value)
    end

    sig do
      override.params(value: T.anything).returns(
        T.any(
          [T::Boolean, T.anything, NilClass],
          [T::Boolean, T::Boolean, Integer]
        )
      )
    end
    def self.try_strict_coerce(value)
    end
  end

  class Union
    abstract!

    extend Anthropic::Extern
    extend Anthropic::Converter

    sig { returns(T::Array[[T.nilable(Symbol), Proc]]) }
    private_class_method def self.known_variants
    end

    sig { overridable.returns(T::Array[[T.nilable(Symbol), T.anything]]) }
    private_class_method def self.variants
    end

    sig { params(property: Symbol).void }
    private_class_method def self.discriminator(property)
    end

    sig do
      params(
        key: T.any(
          Symbol,
          T::Hash[Symbol, T.anything],
          T.proc.returns(Anthropic::Converter::Input),
          Anthropic::Converter::Input
        ),
        spec: T.any(
          T::Hash[Symbol, T.anything],
          T.proc.returns(Anthropic::Converter::Input),
          Anthropic::Converter::Input
        )
      ).void
    end
    private_class_method def self.variant(key, spec = nil)
    end

    sig { params(value: T.anything).returns(T.nilable(Anthropic::Converter::Input)) }
    private_class_method def self.resolve_variant(value)
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def self.===(other)
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def self.==(other)
    end

    sig { override.params(value: T.anything).returns(T.anything) }
    def self.coerce(value)
    end

    sig { override.params(value: T.anything).returns(T.anything) }
    def self.dump(value)
    end

    sig do
      override.params(value: T.anything).returns(
        T.any(
          [T::Boolean, T.anything, NilClass],
          [T::Boolean, T::Boolean, Integer]
        )
      )
    end
    def self.try_strict_coerce(value)
    end
  end

  class ArrayOf
    abstract!

    include Anthropic::Converter

    sig { params(other: T.anything).returns(T::Boolean) }
    def ===(other)
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def ==(other)
    end

    sig do
      override.params(
        value: T.any(
          T::Enumerable[T.anything],
          T.anything
        )
      ).returns(T.any(T::Array[T.anything], T.anything))
    end
    def coerce(value)
    end

    sig do
      override.params(
        value: T.any(
          T::Enumerable[T.anything],
          T.anything
        )
      ).returns(T.any(T::Array[T.anything], T.anything))
    end
    def dump(value)
    end

    sig do
      override.params(value: T.anything).returns(
        T.any(
          [T::Boolean, T.anything, NilClass],
          [T::Boolean, T::Boolean, Integer]
        )
      )
    end
    def try_strict_coerce(value)
    end

    sig { returns(Anthropic::Converter::Input) }
    protected def item_type
    end

    sig do
      params(
        type_info: T.any(
          T::Hash[Symbol, T.anything],
          T.proc.returns(Anthropic::Converter::Input),
          Anthropic::Converter::Input
        ),
        spec: T::Hash[Symbol, T.anything]
      ).void
    end
    def initialize(type_info, spec = {})
    end
  end

  class HashOf
    abstract!

    include Anthropic::Converter

    sig { params(other: T.anything).returns(T::Boolean) }
    def ===(other)
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def ==(other)
    end

    sig do
      override.params(
        value: T.any(
          T::Hash[T.anything, T.anything],
          T.anything
        )
      ).returns(T.any(T::Hash[Symbol, T.anything], T.anything))
    end
    def coerce(value)
    end

    sig do
      override.params(
        value: T.any(
          T::Hash[T.anything, T.anything],
          T.anything
        )
      ).returns(T.any(T::Hash[Symbol, T.anything], T.anything))
    end
    def dump(value)
    end

    sig do
      override.params(value: T.anything).returns(
        T.any(
          [T::Boolean, T.anything, NilClass],
          [T::Boolean, T::Boolean, Integer]
        )
      )
    end
    def try_strict_coerce(value)
    end

    sig { returns(Anthropic::Converter::Input) }
    protected def item_type
    end

    sig do
      params(
        type_info: T.any(
          T::Hash[Symbol, T.anything],
          T.proc.returns(Anthropic::Converter::Input),
          Anthropic::Converter::Input
        ),
        spec: T::Hash[Symbol, T.anything]
      ).void
    end
    def initialize(type_info, spec = {})
    end
  end

  class BaseModel
    abstract!

    extend Anthropic::Extern
    extend Anthropic::Converter

    KnownFieldShape = T.type_alias { {mode: T.nilable(Symbol), required: T::Boolean} }

    sig do
      returns(
        T::Hash[Symbol,
                T.all(
                  Anthropic::BaseModel::KnownFieldShape,
                  {type_fn: T.proc.returns(Anthropic::Converter::Input)}
                )]
      )
    end
    def self.known_fields
    end

    sig do
      returns(
        T::Hash[Symbol,
                T.all(Anthropic::BaseModel::KnownFieldShape, {type: Anthropic::Converter::Input})]
      )
    end
    def self.fields
    end

    sig { returns(T::Hash[Symbol, T.proc.returns(T::Class[T.anything])]) }
    def self.defaults
    end

    sig do
      params(
        name_sym: Symbol,
        required: T::Boolean,
        type_info: T.any(
          {
            const: T.nilable(T.any(NilClass, T::Boolean, Integer, Float, Symbol)),
            enum: T.nilable(T.proc.returns(Anthropic::Converter::Input)),
            union: T.nilable(T.proc.returns(Anthropic::Converter::Input)),
            api_name: Symbol,
            nil?: T::Boolean
          },
          T.proc.returns(Anthropic::Converter::Input),
          Anthropic::Converter::Input
        ),
        spec: T::Hash[Symbol, T.anything]
      ).void
    end
    private_class_method def self.add_field(name_sym, required:, type_info:, spec:)
    end

    sig do
      params(
        name_sym: Symbol,
        type_info: T.any(
          T::Hash[Symbol, T.anything],
          T.proc.returns(Anthropic::Converter::Input),
          Anthropic::Converter::Input
        ),
        spec: T::Hash[Symbol, T.anything]
      ).void
    end
    def self.required(name_sym, type_info, spec = {})
    end

    sig do
      params(
        name_sym: Symbol,
        type_info: T.any(
          T::Hash[Symbol, T.anything],
          T.proc.returns(Anthropic::Converter::Input),
          Anthropic::Converter::Input
        ),
        spec: T::Hash[Symbol, T.anything]
      ).void
    end
    def self.optional(name_sym, type_info, spec = {})
    end

    sig { params(blk: T.proc.void).void }
    private_class_method def self.request_only(&blk)
    end

    sig { params(blk: T.proc.void).void }
    private_class_method def self.response_only(&blk)
    end

    sig { params(other: T.anything).returns(T::Boolean) }
    def ==(other)
    end

    sig do
      override.params(
        value: T.any(
          Anthropic::BaseModel,
          T::Hash[T.anything, T.anything],
          T.anything
        )
      ).returns(T.any(T.attached_class, T.anything))
    end
    def self.coerce(value)
    end

    sig do
      override.params(
        value: T.any(
          T.attached_class,
          T.anything
        )
      ).returns(T.any(T::Hash[T.anything, T.anything], T.anything))
    end
    def self.dump(value)
    end

    sig do
      override.params(value: T.anything).returns(
        T.any(
          [T::Boolean, T.anything, NilClass],
          [T::Boolean, T::Boolean, Integer]
        )
      )
    end
    def self.try_strict_coerce(value)
    end

    sig { params(key: Symbol).returns(T.nilable(T.anything)) }
    def [](key)
    end

    sig { overridable.returns(T::Hash[Symbol, T.anything]) }
    def to_h
    end

    alias_method :to_hash, :to_h

    sig { params(keys: T.nilable(T::Array[Symbol])).returns(T::Hash[Symbol, T.anything]) }
    def deconstruct_keys(keys)
    end

    sig { params(data: T.any(T::Hash[Symbol, T.anything], T.self_type)).void }
    def initialize(data = {})
    end

    sig { returns(String) }
    def to_s
    end

    sig { returns(String) }
    def inspect
    end
  end
end
