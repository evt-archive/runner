require_relative 'spec_init'
require 'minitest/autorun'

describe 'Exclude from runner' do
  it 'runs all of the files except those excluded' do
    return_code = Runner.!('../examples/*.rb'){|exclude| exclude =~ /_1.rb\z/ }
    assert(return_code == 0)
  end
end
