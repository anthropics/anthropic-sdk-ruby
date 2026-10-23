# frozen_string_literal: true

require "prism"
require "rbs"

require_relative "test_helper"

class Anthropic::Test::SignaturesTest < Minitest::Test
  extend Minitest::Serial

  ROOT = File.expand_path("../..", __dir__)
  UNDECLARED = File.join(__dir__, "undeclared_methods.txt")

  class RBIDeclarations < Prism::Visitor
    attr_reader :names

    def initialize
      super
      @names = Set[]
      @scope = []
    end

    def visit_module_node(node)
      @scope.push(node.constant_path.slice)
      super
      @scope.pop
    end

    alias_method :visit_class_node, :visit_module_node

    def visit_def_node(node) = declare(node.name)

    def visit_call_node(node)
      case node.name
      in :attr_reader | :attr_writer | :attr_accessor
        node.arguments.arguments.each do |argument|
          declare(argument.unescaped.to_sym) unless node.name == :attr_writer
          declare(:"#{argument.unescaped}=") unless node.name == :attr_reader
        end
      in :alias_method
        declare(node.arguments.arguments.first.unescaped.to_sym)
      else
      end
    end

    private def declare(name) = @names << [@scope.join("::"), name]
  end

  def test_rbi_and_sig_declare_the_public_methods_of_lib
    declarations = {"rbi" => rbi_declarations, "sig" => sig_declarations}
    undeclared = public_methods_of_lib.flat_map do |label, scopes, name|
      declarations
        .reject { |_, declared| scopes.any? { declared.include?([_1, name]) } }
        .map { |dir, _| "#{dir} #{label}" }
    end
    known = File.exist?(UNDECLARED) ? File.readlines(UNDECLARED, chomp: true) : []

    assert_empty(undeclared - known, "Public in `lib`, but not declared in the folder named before each")
    assert_empty(known - undeclared, "Declared now, or gone: delete these lines of #{UNDECLARED}")
  end

  private

  def in_lib?(location) = location&.first.to_s.start_with?("#{ROOT}/lib/")

  def modules_of_lib(mod = Anthropic)
    nested = mod.constants(false).filter_map do |name|
      const = mod.const_get(name)
      canonical = const.is_a?(Module) && const.name == "#{mod.name}::#{name}"
      const if canonical && in_lib?(mod.const_source_location(name))
    end
    [mod, *nested.flat_map { modules_of_lib(_1) }]
  end

  def public_methods_of_lib
    modules_of_lib.flat_map do |mod|
      [[mod, "#"], [mod.singleton_class, "."]].flat_map do |owner, separator|
        scopes = owner.ancestors.map { _1.singleton_class? ? _1.attached_object.name : _1.name }
        owner
          .public_instance_methods(false)
          .select { in_lib?(owner.instance_method(_1).source_location) }
          .map { ["#{mod.name}#{separator}#{_1}", scopes, _1] }
      end
    end
  end

  def rbi_declarations
    visitor = RBIDeclarations.new
    Dir["#{ROOT}/rbi/**/*.rbi"].each { Prism.parse_file(_1).value.accept(visitor) }
    visitor.names
  end

  def sig_declarations
    Dir["#{ROOT}/sig/**/*.rbs"].each_with_object(Set[]) do |path, names|
      _, _, declarations = RBS::Parser.parse_signature(RBS::Buffer.new(name: path, content: File.read(path)))
      declarations.each { collect_sig(_1, nil, names) }
    end
  end

  def collect_sig(node, scope, names)
    case node
    in RBS::AST::Declarations::Class | RBS::AST::Declarations::Module
      node.members.each { collect_sig(_1, [scope, node.name].compact.join("::"), names) }
    in RBS::AST::Members::MethodDefinition | RBS::AST::Members::AttrReader
      names << [scope, node.name]
    in RBS::AST::Members::AttrWriter
      names << [scope, :"#{node.name}="]
    in RBS::AST::Members::AttrAccessor
      names << [scope, node.name] << [scope, :"#{node.name}="]
    in RBS::AST::Members::Alias
      names << [scope, node.new_name]
    else
    end
  end
end
