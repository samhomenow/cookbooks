## Cron entry fro db backup script
##default['cron']['db']['test']['even']['dbbackup']='0 2 * * * /AZVOL/backups/backup.sh >> /var/log/cronbackup.log 2>&1'
default['cron']['db']['dev']['even']['dbbackup']='0 2 * * * /AZVOL/backups/devevendbbackup.sh >> /var/log/cronbackup.log 2>&1'
default['cron']['db']['test']['even']['dbbackup']='0 2 * * * /AZVOL/backups/testevendbbackup.sh >> /var/log/cronbackup.log 2>&1'
default['cron']['db']['prod']['row']['dbbackup']='0 */4 * * * /AZVOL/backups/sapirowprod.sh >> /var/log/cronbackup.log 2>&1'
