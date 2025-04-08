#!/bin/bash

# ===============================
# 🏨 LUNA'S HOSTEL MANAGEMENT SETUP
# For Ubuntu VPS Hosting
# ===============================

# Load secret environment variables (Twilio & GDrive config)
if [ -f /var/www/lunas_hostel_mgmt/.env.secret ]; then
  export $(grep -v '^#' /var/www/lunas_hostel_mgmt/.env.secret | xargs)
fi

# === Restore Option ===
if [[ "$1" == "restore" ]]; then
  echo "🔁 Restoring latest backup from Google Drive..."
  mkdir -p /var/backups/lunas_hostel
  cd /var/backups/lunas_hostel

  /usr/bin/rclone copy remote_gdrive:lunas_hostel_backups . --max-age 7d --log-file=/var/log/rclone_restore.log
  LATEST_BACKUP=$(ls -t backup-*.sql.gz | head -n1)

  if [[ -f "$LATEST_BACKUP" ]]; then
    echo "📦 Found backup file: $LATEST_BACKUP"
    gunzip -c "$LATEST_BACKUP" | mysql -u root lunas_hostel && echo "✅ Restore completed successfully!"
  else
    echo "❌ No recent backup file found."
  fi
  exit 0
fi

# === Partial Update Mode ===
if [[ "$1" == "update" ]]; then
  echo "♻️ Performing code update from Git..."
  cd /var/www/lunas_hostel_mgmt
  git reset --hard
  git pull origin main
  composer install --no-dev --optimize-autoloader
  php artisan migrate --force
  npm install && npm run prod
  php artisan config:clear && php artisan cache:clear
  echo "✅ Update complete."
  exit 0
fi

# === FULL INSTALL BELOW ===

# ... [Content truncated for brevity]
