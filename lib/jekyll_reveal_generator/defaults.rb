
module JekyllRevealGenerator

  DEFAULT_CONFIGURATION = {
    title: 'My Cool Talk',
    subtitle: "It's the bee's knees",
    author: {
      name: 'Nobody',
      email: 'nobody@example.com',
      github: nil,
      twitter: nil
    },
    collections: [
      'slides'
    ],
    exclude: [
      'bs-config.js',
      'package.json',
      'node_modules'
    ],
    kramdown: {
      input: 'GFM',
      hard_wrap: false,
      parse_block_html: true,
      parse_span_html: true
    }
  }

  DEFAULT_PUBLISH_CONFIGURATION = {
    url: '',
    baseurl: ''
  }


  DEFAULT_PACKAGE_JSON = {
    name: 'my-cool-talk',
    version: JekyllRevealGenerator::VERSION,
    description: "My cool talk",
    main: "index.js",
    scripts: {
      "jekyll:serve": "bundle exec jekyll serve",
      "jekyll:build": "bundle exec jekyll build --config=_configy.yml,_publish.yml",
      "bs:serve": "browser-sync start --config bs-config.js",
      "start": "concurrently \"npm run bs:serve\" \"npm run jekyll:serve\"",
      "test": "echo \"Error: no tests specified\" && exit 1"
    },
    author: 'nobody',
    license: "MIT"
  }

  NPM_PACKAGES = [
    'browser-sync',
    'concurrently'
  ]

end
