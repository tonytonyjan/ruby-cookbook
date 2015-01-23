# MRI Ruby Cookbook

Download MRI Ruby from offical site, install dependent packages, configure, compile and install. Supported versions depend on http://cache.ruby-lang.org/pub/ruby/.

## Attributes

Key            | Type   | Description                     | Default
---            | ---    | ---                             | ---
`ruby.version` | String | Ruby version                    | `'2.2.0'`
`ruby.gems`    | Array  | Additional gems to be installed | `[]`