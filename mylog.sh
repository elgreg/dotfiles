#!/usr/bin/env zsh

NOW=$(date +"%Y-%m-%d")
FILE="$NOW.md"
TIME=$(date +"%H:%M")
MSG="$@"

if [ ! $LOG_PATH ]; then
  echo "No LOG_PATH variable detected. defaulting to $HOME/Documents/mylog"
  OG_PATH="$HOME/Documents/mylog"
fi

cd $LOG_PATH;

function add_log_entry() {
   echo "## $TIME \n\n $MSG \n" >> $FILE
   git add $FILE
   git commit -m "$NOW for $TIME"
  #  git push --quiet
}

if [[ ! -d ".git" ]]; then
  echo "$LOG_PATH does not have a .git folder. Aborting"
  exit 0
fi

if [[ ! -f "$FILE" ]]; then
    echo "# $(date) \n" >> $FILE
fi

if [[ -z "$MSG" ]]; then
  code $LOG_PATH -g $FILE:1000
else
  add_log_entry
fi


