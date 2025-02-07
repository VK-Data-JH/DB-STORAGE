# AAS_DWH_storage_DB

Založeno na image postgres:14.1 (Debian 10)

Neobsahuje žádné logování.

Nainstalována podpora češtiny, ale ponecháno zapnuté ENV LANG en_US.utf8.

Změněna časová zóna na Europe/Prague

Vytvořen podadresář csvdata v adresáři /var/lib/postgresql, pro případnou možnost namapování externí volume.  

V projektu bude přítomen i dockercompose, jehož spuštění provede spuštění 3 kontejnerů s těmito images a s názvy DWH_db_prod, DWH_db_test, DWH_db_dev.
Na všech třech db serverech bude vytvořena databáze DWH.
Vytvoření volume bude řešeno v dockercompose.


## Deployment
V GH Actions spustit workflow "Spustit_DWH". To udělá to, že se nejprve vybuildí (aktualizuje) image pro DWH (musí se jmenovat aas_dwh_storage_db).
Poté se spustí docker compose a spustí 3 x zmíněný image pro dev, prod a test. Deployment nyní probíhá na firemním dockerhostu (10.0.0.9)
