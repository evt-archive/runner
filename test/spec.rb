require_relative 'test_init'

Runner.!('spec/*.rb'){|exclude| exclude == 'view_data_postgresql_connector_init.rb' }
