require "faker"

Given(/^I have a presentation$/) do
  @title = Faker::Book.title
  @slug = Faker::Internet.slug(@title)
  @description = Faker::Company.catch_phrase
  @author = Faker::Name.name
  @email = Faker::Internet.email(@author)
  @user_name = Faker::Internet.user_name(@author)
  @url = "https://#{@user_name}.github.io"
  step('I run `jrg init presentation` interactively')
  step('I type "#{@title}"')
  step('I type "#{@description}"')
  step('I type "#{@author}"')
  step('I type "#{@email}"')
  step('I type "#{@user_name}"')
  step('I type "#{@user_name}"')
  step('I type ""')
  step('I type ""')
  step('I type ""')
  step('I type "#{@url}"')
  step('I type "/#{@slug}"')
  step('I type ""')
  step('I type "yes"')
  step('the directory "presentation" should exist')
end
