log_level                :info
log_location             STDOUT
node_name                'solo'
local_mode               true
client_key               File.expand_path('../solo.pem', __FILE__)
cache_type               'BasicFile'
cache_options( :path => File.expand_path('../../chef/checksums', __FILE__))
cookbook_path [ File.expand_path('../../chef/cookbooks', __FILE__) ]