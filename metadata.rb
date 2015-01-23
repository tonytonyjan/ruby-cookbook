name             'cruby'
maintainer       'tonytonyjan'
maintainer_email 'tonytonyjan@gmail.com'
license          'MIT'
description      'Download, compile and install MRI Ruby'
long_description IO.read(File.join(__dir__, 'README.md'))
version          '1.0.1'
supports 'ubuntu', '14.04'
source_url 'https://github.com/tonytonyjan/ruby-cookbook'
attribute 'ruby/version',
  display_name: 'Ruby version',
  description: 'Ruby version',
  choice: %w[1.8.5-p115 1.8.6-p114 1.8.6-p383 1.8.6-p388 1.8.6-p398 1.8.6-p399
    1.8.6-p420 1.8.7-p174 1.8.7-p248 1.8.7-p249 1.8.7-p299 1.8.7-p302 1.8.7-p330
    1.8.7-p334 1.8.7-p352 1.8.7-p357 1.8.7-p358 1.9-stable 1.9.1-p243 1.9.1-p376
    1.9.1-p378 1.9.1-p429 1.9.1-p430 1.9.1-p431 1.9.2-p0 1.9.2-p136 1.9.2-p180
    1.9.2-p290 1.9.2-p320 1.9.2-p330 1.9.2-preview1 1.9.2-preview3 1.9.2-rc1
    1.9.2-rc2 1.9.3-p545 1.9.3-p547 1.9.3-p550 1.9.3-p551 1.9.3-rc1 2.0-stable
    2.0.0-p0 2.0.0-p195 2.0.0-p247 2.0.0-p353 2.0.0-p451 2.0.0-p481 2.0.0-p576
    2.0.0-p594 2.0.0-p598 2.0.0-rc1 2.0.0-rc2 2.1-stable 2.1.0-preview1
    2.1.0 2.1.2 2.1.3 2.1.4 2.1.5 2.2.0],
  type: 'string',
  required: 'optional',
  recipes: %w[cruby::default],
  default: '2.2.0'
attribute 'ruby/gems',
  display_name: 'Additional gems',
  description: 'Additional gems to be installed',
  type: 'array',
  required: 'optional',
  recipes: %w[cruby::default],
  default: []