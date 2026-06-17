============================================================
MUHASEBE / MALİ MÜŞAVİRLİK TEMASI — KURUMSAL WEB SİTESİ
PHP + MySQL + Bootstrap 5   (Demo marka: Denge Mali Müşavirlik)
============================================================

KURULUM (yerel WAMP / canlı sunucu)
------------------------------------------------------------
1. Dosyaları sunucuya yükleyin
   - Tüm klasörü web kök dizinine kopyalayın (örn: public_html/)

2. Veritabanı oluşturun
   - cPanel / phpMyAdmin'de yeni bir DB oluşturun (örn: muhasebe_db)
   - kurulum.sql dosyasını import edin
   - 7 tablo + örnek veriler otomatik yüklenir

3. Veritabanı bağlantı bilgilerini düzenleyin
   - inc/config.php dosyasını açın
   - DB_HOST, DB_NAME, DB_USER, DB_PASS değerlerini doldurun
   - SITE_URL değerini gerçek domaininizle değiştirin
   - Canlı sunucuda DEBUG'i false yapın
   - Alt klasörde çalışıyorsa .htaccess içindeki RewriteBase'i güncelleyin

4. uploads/ klasörüne yazma izni verin
   - chmod 755 uploads/    (Linux)

5. Admin paneline giriş yapın
   - URL: https://siteniz.com/admin/
   - Kullanıcı: admin   Şifre: admin123
   - !!! Giriş yaptıktan sonra şifrenizi MUTLAKA değiştirin !!!

------------------------------------------------------------
SEKTÖRE ÖZEL ETİKETLER
------------------------------------------------------------
Bu temada motor "kurumsal/hizmet" altyapısıdır; etiketler mali
müşavirliğe uyarlanmıştır:
  Hizmetler  → Hizmetlerimiz (defter, kuruluş, bordro, vergi...)
  Projeler   → Sektörler (hizmet verilen sektörler)
  Blog       → Mali Rehber
  Teklif Al  → Teklif Al (form: şirket türü, çalışan sayısı...)

------------------------------------------------------------
DOSYA YAPISI
------------------------------------------------------------
├── index.php             Anasayfa
├── hakkimizda.php        Hakkımızda
├── hizmetler.php         Hizmet listesi
├── hizmet-detay.php      Tek hizmet sayfası (?slug=...)
├── projeler.php          Sektörler (filtreli)
├── proje-detay.php       Tek sektör sayfası (?slug=...)
├── blog.php              Mali rehber listesi
├── blog-detay.php        Tek yazı (?slug=...)
├── iletisim.php          İletişim formu + harita
├── teklif.php            Teklif / ön görüşme formu
│
├── inc/                  config, db, helpers, header, footer
├── admin/                Yönetim paneli (login, CRUD'lar, ayarlar)
├── css/style.css         Tema CSS (petrol yeşili/amber palet)
├── js/main.js            Navbar scroll efekti
├── uploads/              Yüklenen görseller (PHP engelli)
└── kurulum.sql           DB şema + örnek veri

------------------------------------------------------------
TEKNİK DETAYLAR
------------------------------------------------------------
- PHP 7.4+ (önerilen 8.x), MySQL 5.7+ / MariaDB
- PDO prepared statements, CSRF token, password_hash (bcrypt)
- XSS koruması (e() htmlspecialchars)
- Bootstrap 5.3.2 + Bootstrap Icons 1.11 (CDN)
- Responsive (mobil uyumlu)

------------------------------------------------------------
RENK PALETİ
------------------------------------------------------------
Birincil  : #0f766e (petrol yeşili)
Vurgu     : #d97706 (amber)
Koyu      : #0c1f1e (koyu petrol)
Açık      : #f0fdfa (buz yeşili)
- css/style.css → :root değişkenlerinden değiştirebilirsiniz

------------------------------------------------------------
DESTEK / NOTLAR
------------------------------------------------------------
- Yerel test:   http://localhost/muhasebe-php/
- Admin:        /admin/  (admin / admin123)
- DB import:    phpMyAdmin → Import → kurulum.sql

İyi çalışmalar!
