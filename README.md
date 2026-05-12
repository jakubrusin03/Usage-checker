# Systemd Disk use checker 

## Co zrobiłem

Napisałem skrypt który pobiera w ilu % zajety jest dysk na serwerze, oraz date w momencie ktorym pobrało
dane. Skrypt wykonuje sie automatycznie co 30 minut i zapisuje stan do d_check.log

## Struktura pliku .service 
[Unit] - opisuje usluge i jej zależności 
[Service] - Określa, jak usługa ma być uruchamiana
[Install] - Określa kiedy usługa ma być uruchamiana z automatu

## Przydatne komendy ktorych użyłem 
| Komenda | Co robi |
|---|---|
| `systemctl daemon-reload` | przeładowanie systemd |
| `systemctl start d_check` | uruchomienie serwisu |
| `systemctl enable d_check` | serwis uruchomi sie automatycznie po starcie serwera |
| `journalctl -u d_check -f` | sledzenie logow serwisu na zywo |

