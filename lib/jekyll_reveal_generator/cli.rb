require "thor"
require "yaml"
require "json"
require "logger"
require "recursive-open-struct"
require "jekyll_reveal_generator/defaults"
require "jekyll_reveal_generator/create_new_presentation"
require "jekyll_reveal_generator/create_slide"

$logger = Logger.new(STDERR)

module JekyllRevealGenerator
  class Cli < Thor
    include Thor::Actions

    add_runtime_options!

    register(JekyllRevealGenerator::CreateNewPresentation, "init", "init", "Creates a new jekyll-reveal presentation")
    register(JekyllRevealGenerator::CreateSlide, "slide", "slide", "Create a new slide")
  end
end
