require_relative 'spec_init'

context 'Exclude from runner' do
  test 'runs all of the files except those excluded' do
    $example_1_ran = false
    $example_2_ran = false

    Runner.('../examples/*.rb') { |exclude| exclude =~ /example_1.rb\z/ }
    assert(!$example_1_ran)
    assert($example_2_ran)
  end
end
