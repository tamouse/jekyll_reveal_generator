Feature: Cucumber

  Scenario: First Run

    Given a file named "file.txt" with:
    """
    Hello, Aruba!
    """
    When I run `cat file.txt`
    Then the file "file.txt" should contain:
    """
    Hello, Aruba!
    """
