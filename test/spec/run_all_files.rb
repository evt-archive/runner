require_relative 'spec_init'
require 'minitest/autorun'

describe 'Runner' do
  it 'runs all of the files' do
    return_code = Runner.! '../examples/*.rb'
    assert(return_code == 0)
  end
end
