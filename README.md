# ge_smallworld_backup.sh
GE Smallworld (cold) backup script.

Smallworld provides you with internal tools and procedures to take hot-backups of a live system but they sometimes are a bit complicated to deploy if you aren’t “fluent” in Magik and, in my case, it was “too much” for my Smallworld environment.

Because it is also possible to totally shutdown the Smallworld process to make a cold-backup (another supported method), I created the following script which, added to the system as a cronjob, allows you to take a full cold-backup of your Smallworld environment.

The script is very straight-forward and doesn’t make many checks but it works for the environment I created it for. Feel free to tailor it to your own needs.

# disclaimer
this is provided on an “AS IS” basis. The author is not to be held responsible for any damage this script and its usage might cause.

