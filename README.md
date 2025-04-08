# 🏨 Luna's Hostel Management - VPS Deployment

Skrip otomatis untuk install, update, backup, restore & auto-deploy aplikasi **Luna’s Hostel Management** di VPS berbasis Ubuntu.

## 📦 Fitur
- Install Laravel lengkap (Apache, MySQL, PHP, Node)
- Setup database, queue, scheduler, SSL
- Backup harian + unggah ke Google Drive
- Restore backup otomatis
- Notifikasi WhatsApp saat backup sukses
- Auto-deploy dari GitHub Actions

## ⚙️ Perintah Dasar

| Perintah               | Fungsi                                   |
|------------------------|-------------------------------------------|
| `./setup.sh`           | Instalasi penuh                           |
| `./setup.sh update`    | Partial update (GitHub Actions safe)      |
| `./setup.sh restore`   | Restore database dari Google Drive backup |

## 🛠️ Konfigurasi Manual

1. Buat file rahasia:
```bash
nano /var/www/lunas_hostel_mgmt/.env.secret
