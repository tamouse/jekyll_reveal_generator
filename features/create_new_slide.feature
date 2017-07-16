Feature: Create a New Slide

  Scenario: I can create a new multi section slide in markdown

    Given I have a presentation
    When I cd to "presentation"
    Then the directory named "source" should exist
    Then the directory named "source/_slides" should exist
    When I run `jrg slide` interactively
    And I type "1"
    And I type ""
    And I type "Welcome to my Presentation!"
    And I type ""
    And I type "markdown"
    And I type "multi"
    Then the file named "source/_slides/01-00-welcome-to-my-presentation.markdown" should exist
    And the file "source/_slides/01-00-welcome-to-my-presentation.markdown" should contain:
    """
    ---
    layout: slide
    title: "Welcome to my Presentation!"
    slug: "01-00-welcome-to-my-presentation"
    group: 1
    sequence: 0
    ---

    <section>

    ### {{ page.title }}

    one

    </section>

    <section>

    ### {{ page.title }}

    two

    </section>
    """
