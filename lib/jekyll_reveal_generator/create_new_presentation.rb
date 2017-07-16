require "yaml"
require "thor"

module JekyllRevealGenerator
  class CreateNewPresentation < Thor::Group
    include Thor::Actions

    add_runtime_options!

    desc "Creates a new Jekyll-Reveal Presentation"
    argument :folder, type: :string, desc: "Folder to generate new presention"

    attr_accessor :init_options

    def init
      self.init_options = RecursiveOpenStruct.new({
          title: '',
          description: '',
          author: {
            name: '',
            email: '',
            twitter: '',
            github: ''
          },
          venue: {
            name: '',
            ssid: '',
            password: ''
          },
          publishing: {
            site_url: '',
            base_url: '',
            destination: 'docs'
          }
        }
          .merge({"folder" => folder})
          .merge(options))

      self.init_options.title = ask("Title of presentation:", :green)
      if init_options.title.match(%r{\A\s*\z})
        $logger.error("You must give a title")
        exit -1;
      end
      self.init_options.description = ask("Description:")
      self.init_options.author.name = ask("Author's name:")
      self.init_options.author.email = ask("Author's email:")
      self.init_options.author.twitter = ask("Author's twitter handle:")
      self.init_options.author.github = ask("Author's github name:")
      self.init_options.venue.name = ask("Name of venue:", default: "T.B.D.")
      self.init_options.venue.ssid = ask("What is the SSID?", default: "T.B.D.")
      self.init_options.venue.password = ask("What is the network password? ", default: "T.B.D.")
      self.init_options.publishing.site_url = ask("What is the published site url?")
      self.init_options.publishing.base_url = ask("What is the base URL for the published site?")
      self.init_options.publishing.destination = ask("What is the destination folder for the published site?", default: "docs")

      puts init_options.to_h.to_yaml
      unless yes?("Is this correct?", :red)
        $logger.error("quitting, try again")
        exit -1;
      end
      puts "Creating site"
    end

    def self.source_root
      File.expand_path("../../../templates", __FILE__)
    end

    def intiialize_directory
      config = {
        verbose: init_options.quiet || true,
        force: init_options.force || false,
        pretend: init_options.pretend || false,
        quiet: init_options.quient || false
      }
      empty_directory(init_options.folder, config)
      destination_root = init_options.folder
      directory("presentation", init_options.folder, config)
    end

    def initialize_presentation
      Bundler.with_clean_env do
        inside(init_options.folder) do
          run 'git init'
          run 'sh setup.sh'
          run 'git add --all -v'
          run 'git commit -m "Initial Commit"'
        end
      end
    end


  end

end
