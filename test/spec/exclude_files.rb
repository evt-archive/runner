require_relative 'spec_init'
require 'minitest/autorun'

$example_1_ran = false
$example_2_ran = false

describe 'Exclude from runner' do
  it 'runs all of the files except those excluded' do
    return_code = Runner.!('../examples/*.rb') { |exclude| exclude =~ /example_1.rb\z/ }
    refute($example_1_ran)
    assert($example_2_ran)
  end
end
