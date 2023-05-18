# Docker compose for crunchy-cli 

This is a docker compose setup for running [crunchy-cli](https://github.com/crunchy-labs/crunchy-cli) in a docker container. Prerequisites are `docker` and `docker compose` 

# Usage

Set all required environment variables in the `.env` file. The `COOKIE` variable is used for the `--etp-rt` login functionality of crunchy-cli. The cookie can be obtained by logging into your crunchyroll account, open the developer console of your browser, click on the application tab and select cookies in the storage listing. Search for an entry called `ept_rt` and copy its value into the `.env` file. Don't forget to set a download directory or all files will be downloaded to the default directory `downloads` within this project directory. 

Execute `docker-compose up` in the project directory to run the container. You can execute `docker compose up -d` if you want silent execution. Use `docker compose down` to stop the container. If the docker image has not been built yet, it will be on the first run. The created docker image contains everything needed to use crunchy-cli with its full potential. Define all download tasks in the file `./script/download.sh`. The container will start and execute every command in this file. 

Example content for `script/download.sh`:
```
#!/usr/bin/env bash

## Start ##
# Create a new download directory if it does'nt exist yet
mkdir -p one-piece
# Change directory to download directory
cd one-piece
# Download files
crunchy-cli archive -a ja-JP -a de-DE -s de-DE -s en-US -o '[S{season_number}E{episode_number}] {title}.mkv' https://www.crunchyroll.com/de/series/GRMG8ZQZR/one-piece
# After finishing all downloads go back into the parent directory and start next task
cd ..
## End ##

## Start ##
# Create a new download directory if it does'nt exist yet
mkdir -p naruto
# Change directory to download directory
cd naruto
# Download files
crunchy-cli archive -a ja-JP -a de-DE -s de-DE -s en-US -o '[S{season_number}E{episode_number}] {title}.mkv' https://www.crunchyroll.com/de/series/GY9PJ5KWR/naruto
# After finishing all downloads go back into the parent directory and start next task
cd ..
## End ##

```

For further information about crunchy-cli visit the repository: https://github.com/crunchy-labs/crunchy-cli

# Troubleshooting

If you reach your rate limit, you need to adjust the download task or all episodes will be downloaded again. See https://github.com/crunchy-labs/crunchy-cli#episode-filtering for information on how to do that.

# 📜 Disclaimer

This tool is **ONLY** meant for private use. You need a subscription to [`💳 Crunchyroll Premium 💳`](https://www.crunchyroll.com/welcome#plans) to download premium content.

**You are entirely responsible for what happens to files you downloaded through crunchy-cli.**

# ⚖ License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0) - see the [LICENSE](LICENSE) file for more details.