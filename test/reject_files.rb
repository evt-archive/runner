require_relative 'test_init'

Runner.! 'examples/*.rb' do |reject|
  reject =~ /_1.rb\z/
end
