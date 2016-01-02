require 'rubygems'
require 'interactive_editor'
require 'ap'

IRB::Irb.class_eval do
  def output_value
    ap @context.last_value
  end
end

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT_MODE] = false
