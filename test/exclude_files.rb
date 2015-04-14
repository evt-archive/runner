require_relative 'test_init'

Runner.! 'examples/*.rb' do |exclude|
  exclude =~ /_1.rb\z/
end
