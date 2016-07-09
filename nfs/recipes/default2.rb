def nfs(mounts)
mounts.each do |host, mount|
    directory "#{mount}" do
      owner 'root'
      group 'root'
      mode '0755'
    end
    mount "#{mount}" do
      device "#{host}"
      fstype 'nfs'
      options 'ro,bg,_netdev,rsize=8192,actimeo=10,timeo=14,intr'
      action [:mount, :enable]
    end
  end
end
puts node.chef_environment
if node.chef_environment =~ /latest/
  mounts = { '10.199.50.16:/WDPRO_TRIDION_QA' => '/tridion_qa', '10.199.50.16:/wdpro_tridion_staging' => '/tridion_staging', '10.199.50.16:/wdpro_tridion_preprod' => '/tridion_preprod' }
   nfs mounts 
   
end
if node.chef_environment =~ /jam|sam/
  mounts = { '10.198.233.17:/wdpro_tridion_prod' => '/tridion_prod' }
   nfs mounts
end
