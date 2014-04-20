#!/bin/sh 

./etc/tune-profiles/functions 

start() {
        set_disk_alpm min_power 
	
	enable_wifi_powersave 
	
	disable_cd_polling 
	
	disable_bluetooth 
	
	enable_snd_ac97_powersave
	
	enable_cpu_multicore_powersave

        return 0
}



stop() {
        set_disk_alpm max_performance
	
	disable_wifi_powersave 
	
	disable_cpu_multicore_powersave 
	
	disable_snd_ac97_powersave
	return 0


}
