require_relative 'spec_init'

context 'Runner' do
  test 'runs all of the files' do
    $example_1_ran = false
    $example_2_ran = false

    Runner.('../examples/*.rb')
    assert($example_1_ran)
    assert($example_2_ran)
  end
end
