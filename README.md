# JekyllRevealGenerator

Generate Jekyll-Reveal.js Slide Presentations

You should be familiar with [Jekyll] and [Reveal] to use this generator
effectively.

[Jekyll]: http://jekyllrb.com "The blog-aware static site generator"
[Reveal]: http://lab.hakim.se/reveal-js/#/ "The HTML presentation framework"

## Installation

Install it yourself as:

    $ gem install jekyll_reveal_generator

## Usage

  	$ jekyll_reveal_generator help

or

    $ jrg help

To create a new presentation, use `init`:

    $ jrg init my_prez

and answer the prompts. This will run the `setup.sh` script and
initialize a git repository and make the first commit.

To create a slide, from the presentation root directory, run:

    $ cd my_prez
    $ jrg slide

and answer the prompts.

The included Rakefile has two tasks, `serve` and `publish`:

* `serve` launches the jekyll server on port 4000
* `publish` builds the presentation adding the `_publish.yml`
  configuration to the normal configuration

## Templates

The slide presentation template is in the `templates/presentation/`
directory.

The new slide templates are in `templates/slides`

There is no provision for adding or modifying the templates.

## Development

After checking out the repo, run `bin/setup` to install
dependencies. Then, run `rake test` to run the tests. You can also run
`bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will
create a git tag for the version, push git commits and tags, and push
the `.gem` file to [rubygems.org](https://rubygems.org).

This gem utilizes [Thor] as a generator.

## Testing

Testing is using [RSpec] for unit testing, and [Aruba] for
command-line testing.

[RSpec]: http://rspec.info/ "Behavior-Driven Development for Ruby. Making TDD Productive and Fun"
[Aruba]: https://github.com/cucumber/aruba "Test command-line applications with Cucumber-Ruby, Rspec, or Minitest"

## Contributing

Bug reports and pull requests are welcome on GitHub
at <https://github.com/tamouse/jekyll_reveal_generator>.
