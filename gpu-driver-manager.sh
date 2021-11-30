#!/bin/bash
: '
Nvidia GTX 1660 S GPU için açık kaynak sürücü ile kapalı kaynak sürücü arasında geçiş yapmamı sağlayan Bash shell scriptim (CLI).
	nvidia ile nouveau (xf86-video-nouveau) arasında köprü oluşturur.
	nvidia-lts ile nouveau (xf86-video-nouveau) arasında oluşturur.
		
Creator: Fethi MADAN
'

if [[ $(whoami) == "root" ]]; then

	file1="/usr/lib/modprobe.d/nvidia.conf"

	if [ -s "$file1" ]; then 
	   nvidiaBlackListDurumu=`cat /usr/lib/modprobe.d/nvidia.conf | grep "blacklist nouveau"`
	   if [[ $nvidiaBlackListDurumu == "blacklist nouveau" ]]; then
			echo "Şuan; nouveau (açık kaynak sürücü), $file1 dosyasındaki blacklist'tedir."
			echo "Şuan, nvidia (kapalı kaynak sürücü) aktiftir."
			echo -n "nvidia açık kaynak sürücüsünü (nouveau / xf86-video-nouveau) aktif etmek ister misin? [E/h] "
			read responseForNouveou
			if [[ "$responseForNouveou" == "e" || "$responseForNouveou" == "E" || "$responseForNouveou" == "evet" ]]; then
					rm $file1
					touch $file1
					echo "#blacklist nouveau" > $file1
					echo "İlgili yapılandırma dosyası düzenlendi."
					echo "nouveau açık kaynak sürücüsünün aktif olması için reboot yapmak gerekiyor."
					echo -n "Şimdi reboot yapılsın mı? [E/h] "
					read responseForReboot
					if [[ "$responseForReboot" == "e" || "$responseForReboot" == "evet" ]]; then
						reboot
					fi
				fi
		elif [[ $nvidiaBlackListDurumu == "#blacklist nouveau" ]]; then
			echo "Şuan; nouveau (açık kaynak sürücü), $file1 dosyasındaki blacklist'te değildir."
			echo "Şuan, nvidia açık kaynak sürücüsü (nouveau / xf86-video-nouveau) aktiftir."
				echo -n "nvidia (kapalı kaynak) sürücüsünü aktif etmek ister misin? [E/h] "
				read response
				if [[ "$response" == "e" || "$response" == "E" || "$response" == "evet" ]]; then
					rm $file1
					touch $file1
					echo "blacklist nouveau" > $file1
					echo "İlgili yapılandırma dosyası düzenlendi."
					echo "nvidia kapalı kaynak sürücüsünün aktif olması için reboot yapmak gerekiyor."
					echo -n "Şimdi reboot yapılsın mı? [E/h] "
					read responseForReboot
					if [[ "$responseForReboot" == "e" || "$responseForReboot" == "evet" ]]; then
						reboot
					fi
				fi
		else
			echo "/usr/lib/modprobe.d/nvidia.conf dosyasını incele çünkü beklediğimden farklı içeriği var."
		fi
	fi


	file2="/usr/lib/modprobe.d/nvidia-lts.conf"

	if [ -s "$file2" ];then 
	   nvidiaBlackListDurumu=`cat /usr/lib/modprobe.d/nvidia-lts.conf | grep "blacklist nouveau"`
	   if [[ $nvidiaBlackListDurumu == "blacklist nouveau" ]]; then
			echo "Şuan; nouveau (açık kaynak sürücü), $file2 dosyasındaki blacklist'tedir."
			echo "Şuan, nvidia-lts (kapalı kaynak sürücü) aktiftir."
			echo -n "nvidia açık kaynak sürücüsünü (nouveau / xf86-video-nouveau) aktif etmek ister misin? [E/h] "
			read responseForNouveou
			if [[ "$responseForNouveou" == "e" || "$responseForNouveou" == "E" || "$responseForNouveou" == "evet" ]]; then
					rm $file2
					touch $file2
					echo "#blacklist nouveau" > $file2
					echo "İlgili yapılandırma dosyası düzenlendi."
					echo "nouveau açık kaynak sürücüsünün aktif olması için reboot yapmak gerekiyor."
					echo -n "Şimdi reboot yapılsın mı? [E/h] "
					read responseForReboot
					if [[ "$responseForReboot" == "e" || "$responseForReboot" == "evet" ]]; then
						reboot
					fi
				fi
		elif [[ $nvidiaBlackListDurumu == "#blacklist nouveau" ]]; then
			echo "Şuan; nouveau, $file2 dosyasındaki blacklist'te değildir."
				echo -n "nvidia-lts (kapalı kaynak) sürücüsünü aktif etmek ister misin? [E/h] "
				read response
				if [[ "$response" == "e" || "$response" == "E" || "$response" == "evet" ]]; then
					rm $file2
					touch $file2
					echo "blacklist nouveau" > $file2
					echo "İlgili yapılandırma dosyası düzenlendi."
					echo "nvidia-lts kapalı kaynak sürücüsünün aktif olması için reboot yapmak gerekiyor."
					echo -n "Şimdi reboot yapılsın mı? [E/h] "
					read responseForReboot
					if [[ "$responseForReboot" == "e" || "$responseForReboot" == "evet" ]]; then
						reboot
					fi
				fi
		else
			echo "/usr/lib/modprobe.d/nvidia-lts.conf dosyasını incele çünkü beklediğimden farklı içeriği var."
		fi
	fi

else
	echo "Lütfen, superuser (root) olarak programı çalıştırınız. "
fi

exit
