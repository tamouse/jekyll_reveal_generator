require "thor"
require "yaml"
require "json"
require "logger"
require "recursive-open-struct"
require "jekyll_reveal_generator/defaults"
require "jekyll_reveal_generator/create_new_presentation"

$logger = Logger.new(STDERR)

module JekyllRevealGenerator
  class Cli < Thor
    include Thor::Actions

    add_runtime_options!


    desc "new TITLE", "Generage a new slide"
    method_option(:format, default: 'markdown', desc: "Format of slide: html/markdown", aliases: "--fmt")
    method_option(:sequence, default: 0, desc: "Sequence number in Group", aliases: "--seq", type: :numeric)
    method_option(:group, default: 0, desc: "Group number", aliases: "--grp", type: :numeric)
    def new(title)
      o = RecursiveOpenStruct.new({}
          .merge("title" => title)
          .merge(options))
      slug = slide_slug(o)
      slug
    end

    register(JekyllRevealGenerator::CreateNewPresentation, "init", "init", "Creates a new jekyll-reveal presentation")


    private

    def slide_slug(o)
      pattern = "%02d-%02d-%s.%s"
      pattern % [
        o.group.to_i,
        o.sequence.to_i,
        o.title.downcase.gsub(/[^[:alnum:]]+/,'-'),
        o.format
      ]
    end
  end
end
