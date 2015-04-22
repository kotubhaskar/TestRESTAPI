require'cucumber'
require 'rspec'
require 'rest_client'
require 'nokogiri'
require 'turnip'

def update_tokens(template_file)
	template = ""
	open(template_file) {|f|
  	template = f.to_a.join
 	}
 ERB.new(template, 0, "'%<>'").result
end