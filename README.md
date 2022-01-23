# Nvidia-GPU-driver-manager-GLI-for-archlinux
Nvidia GPU kullananlar için açık kaynak sürücü veya resmi sürücü (arch repository) arasında geçiş yapmayı sağlar.

Archlinux distrolu işletim sistemimde Nvidia GTX 1660 S model bir ekran kartı kullanıyorum. Bu kartın resmi (official) sürücüsünü Archlinux resmi deposundan yükleyip kullanırken, açık kaynak kodlu sürücüsünü de bazen kullanmam gerekti. Açık kaynak - kapalı kaynak sürücüler arasında geçiş yapmak istediğimde ise ya bir sürücüyü siliyordum ya da yapılandırma (.conf vb.) dosyalarını düzenlemem gerekiyordu. Bu zahmetten kurtulmak için basit bir bash shell script yazdım.

Grafikal arayüzü yoktur, terminal ile çalışır (CLI).


Programın kulllanımı:
gpu-driver-manager.sh dosyasını /usr/local/bin dizinine kaydedin.
Terminalde aşağıdaki komut satırını çalıştırın.
sudo gpu-driver-manager.sh 


