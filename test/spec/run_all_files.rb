require_relative 'spec_init'
require 'minitest/autorun'

$example_1_ran = false
$example_2_ran = false

describe 'Runner' do
  it 'runs all of the files' do
    return_code = Runner.! '../examples/*.rb'
    assert($example_1_ran)
    assert($example_2_ran)
  end
end
