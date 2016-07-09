default['server']['type']="sam1"
default['chef_environment']="prod"
#default['nfslibs']['mounts1']['192.168.33.101:/WDPRO_TRIDION_QA']="/WDPRO_TRIDION_QA1"
#default['nfslibs']['mounts1']['192.168.33.101:/WDPRO_TRIDION_QA1']="/WDPRO_TRIDION_QA2"
#default['nfslibs']['mount2']=[ { '192.168.33.101:/WDPRO_TRIDION_QA' => "/WDPRO_TRIDION_QA" } ]
default['nfslibs']['mounts1']={'192.168.33.101:/WDPRO_TRIDION_QA'=>'/WDPRO_TRIDION_QA1','192.168.33.101:/WDPRO_TRIDION_QA2'=>'/WDPRO_TRIDION_QA2'}
