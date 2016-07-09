module Helpers

def sam(host,mounts)

                directory "#{mounts}" do
                        user 'root'
                        group 'root'
                        mode '0755'
                end

                mount "#{mounts}" do
                        device "#{host}"
                        fstype 'nfs'
                        options 'ro,_netdev,rsize=8192,actimeo=10,timeo=14,intr'
                        action [:mount, :enable]
                end

                end

end


