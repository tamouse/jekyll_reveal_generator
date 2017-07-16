Feature: Create a new presentation

  Scenario: Run the command with the init subcommand

    Given the directory named "presentation" should not exist
    When I run `jrg init presentation` interactively
    # When I wait for output to contain "Title of presentation: "
    And I type "The Presentation"
    # When I wait for output to contain "Description: "
    And I type "A description of the presentation"
    # When I wait for output to contain "Author's name: "
    And I type "Jorge Biggs"
    # When I wait for output to contain "Author's email: "
    And I type "jorge@biggs.info"
    # When I wait for output to contain "Author's twitter handle: "
    And I type "tweetjorge"
    # When I wait for output to contain "Author's github name: "
    And I type "jorgegitter"
    # When I wait for output to contain "Name of venue: "
    And I type "Carnegie Hall"
    # When I wait for output to contain "What is the SSID? "
    And I type "You Kids Git Offa Mah LAN"
    # When I wait for output to contain "What is the network password? "
    And I type "how's this for a password, ma?"
    # When I wait for output to contain "What is the published site url? "
    And I type "https://jorgegitter.github.io"
    # When I wait for output to contain "What is the base URL for the published site? "
    And I type "/the-best-presentation-of-my-life"
    # When I wait for output to contain "What is the destination folder for the published sites? "
    And I type ""
    # When I wait for output to contain "Is this correct? "
    And I type "yes"
    Then the following directories should exist:
      | presentation                  |
      | presentation/.git             |
      | presentation/source           |
      | presentation/source/_data     |
      | presentation/source/_includes |
      | presentation/source/_layouts  |
      | presentation/source/_slides   |
      | presentation/source/css       |
      | presentation/source/js        |
    And the following files should exist:
      | presentation/.gitignore                            |
      | presentation/Gemfile                               |
      | presentation/Gemfile.lock                          |
      | presentation/Rakefile                              |
      | presentation/_config.yml                           |
      | presentation/_publish.yml                          |
      | presentation/setup.sh                              |
      | presentation/source/index.html                     |
      | presentation/source/notes.html                     |
      | presentation/source/_data/info.yml                 |
      | presentation/source/_includes/slide_footer.html    |
      | presentation/source/_includes/slide_header.html    |
      | presentation/source/_includes/slides.html          |
      | presentation/source/_layouts/printed_notes.html    |
      | presentation/source/_layouts/slide.html            |
      | presentation/source/_layouts/slideshow.html        |
      | presentation/source/_slides/00-00-title-slide.md   |
      | presentation/source/_slides/00-01-code-sample.html |
      | presentation/source/css/printed_styles.sass        |
      | presentation/source/css/styles.sass                |
      | presentation/source/css/zenburn.css                |
      | presentation/source/js/revealConfig.js             |
    Then the file "presentation/_publish.yml" should contain:
      """
      url: "https://jorgegitter.github.io"
      baseurl: "/the-best-presentation-of-my-life"
      destination: "docs"
      """
    Then the file "presentation/source/_data/info.yml" should contain:
      """
      title: "The Presentation"
      description: "A description of the presentation"
      author:
        name: "Jorge Biggs"
        email: "jorge@biggs.info"
        twitter: "tweetjorge"
        github: "jorgegitter"
      venue:
        name: "Carnegie Hall"
        ssid: "You Kids Git Offa Mah LAN"
        password: "how's this for a password, ma?"
      """
    When I cd to "presentation"
    And I run `git status`
    Then the output should contain "nothing to commit, working tree clean"
