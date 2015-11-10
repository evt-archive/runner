require_relative 'spec_init'

describe 'Exclude from runner' do
  it 'runs all of the files except those excluded' do
    $example_1_ran = false
    $example_2_ran = false

    Runner.('../examples/*.rb') { |exclude| exclude =~ /example_1.rb\z/ }
    refute($example_1_ran)
    assert($example_2_ran)
  end
end
