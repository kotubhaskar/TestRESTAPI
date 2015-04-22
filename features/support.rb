require 'rest_client'
require 'nokogiri'

def update_tokens(template_file)
	template = ""
	open(template_file) {|f|
  	template = f.to_a.join
 	}
 ERB.new(template, 0, "'%<>'").result
end