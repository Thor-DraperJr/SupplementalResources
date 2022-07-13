# Backups

## Full, Incremental, and Differential Backups

* A full backup creates a backup of the entire system.
  * full backups are slow and require a large storage space capable of storing the entire system.
* Incremental and differential backups archive only data that has changed since the last full backup.
  * Incremental backups are done after a full backup has been performed on a system.
  * Incremental backups capture only what has changed since the last incremental backup. This makes incremental backups smaller than full backups.
  * Consider the frequency of incremental backups (e.g., hourly or daily). Making incremental backups hourly ensures that each backup is small and restores (relatively) quickly, with minimum loss of data after an attack.

A checkpoint is a moment of time before writing nth record to the archive (a write checkpoint), or before reading nth record from the archive (a read checkpoint). Checkpoints allow to periodically execute arbitrary actions.
