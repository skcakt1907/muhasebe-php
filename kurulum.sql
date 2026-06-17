-- ============================================
-- MUHASEBE / MALİ MÜŞAVİRLİK TEMASI — Kurulum SQL
-- (tema-master Kurumsal/Hizmet arketipinden türetildi)
-- Kullanım: phpMyAdmin > Import  (veya: mysql -u root < kurulum.sql)
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `muhasebe_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `muhasebe_db`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Denge Mali Müşavirlik'),
('site_baslik','Denge Mali Müşavirlik — Muhasebe, Vergi ve Danışmanlık'),
('site_aciklama','Şirket kuruluşundan defter tutmaya, bordrodan vergi planlamasına; işletmenizin tüm mali süreçlerini güvenle yönetiyoruz. Siz işinize odaklanın, rakamları bize bırakın.'),
('telefon','+90 555 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@dengemusavirlik.com'),
('adres','Finans Mah. Mevzuat Cad. No:18 Kat:3, Şişli / İstanbul'),
('calisma_saati','Pzt - Cum: 09:00 - 18:00'),
('hakkimizda_kisa','Denge Mali Müşavirlik, SMMM ruhsatlı uzman kadrosuyla işletmelere muhasebe, vergi, bordro ve mali danışmanlık hizmetleri sunan; teknolojiyi yakından takip eden çağdaş bir müşavirlik ofisidir.'),
('hakkimizda_uzun','Denge Mali Müşavirlik olarak işletmenizi sadece kayıt tutulacak bir mükellef olarak değil, büyütülecek bir iş ortağı olarak görüyoruz. E-dönüşüm süreçlerinden (e-fatura, e-defter, e-arşiv) vergi planlamasına, şirket kuruluşundan teşvik başvurularına kadar tüm mali süreçlerinizi tek elden yönetiyoruz. Dijital altyapımız sayesinde belgelerinizi online iletebilir, mali tablolarınıza dilediğiniz an ulaşabilirsiniz. Beyanname ve bildirim takvimini biz takip ederiz; ceza riskiyle hiç tanışmazsınız. Düzenli bilgilendirme raporlarımızla işletmenizin mali fotoğrafını her ay net olarak görürsünüz.'),
('misyon','Mükelleflerimizin mali süreçlerini mevzuata tam uyumlu, şeffaf ve zamanında yöneterek onlara ceza riski olmayan, öngörülebilir bir finansal düzen sunmak.'),
('vizyon','Teknolojiyi en iyi kullanan, danışan odaklı çalışan ve mükelleflerinin büyümesine ortak olan referans müşavirlik ofisi olmak.'),
('yil','18'),
('proje_sayi','350'),
('musteri_sayi','1000'),
('personel_sayi','12'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-journal-bookmark',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Defter Tutma & Muhasebe','defter-tutma','İşletme ve bilanço esasına göre eksiksiz, mevzuata uyumlu kayıt düzeni.','Gelir-gider belgelerinizin kaydından KDV, muhtasar ve geçici vergi beyannamelerine kadar tüm rutin muhasebe işlemlerinizi yürütüyoruz. E-defter ve e-fatura süreçlerinizi kuruyor, belgelerinizi dijital ortamda teslim almanızı sağlıyoruz. Aylık mali özet raporuyla işletmenizin durumunu net görürsünüz.','bi-journal-bookmark','https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=800&q=80',1),
('Şirket Kuruluşu','sirket-kurulusu','Şahıs, limited veya anonim — doğru şirket türüyle hızlı ve eksiksiz kuruluş.','İşinize en uygun şirket türünün seçiminden ticaret sicili tesciline, vergi dairesi açılışından e-dönüşüm başvurularına kadar kuruluş sürecinin tamamını yönetiyoruz. Genç girişimci vergi teşviki gibi avantajlardan yararlanmanız için gerekli başvuruları da biz yapıyoruz. Çoğu kuruluş 3-5 iş gününde tamamlanır.','bi-building-add','https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=800&q=80',2),
('Bordro & SGK İşlemleri','bordro-sgk','İşe giriş-çıkış, bordro, teşvik ve tüm SGK bildirimlerinde tam uyum.','Personel işe giriş ve çıkış bildirimleri, aylık prim ve hizmet belgeleri, bordro hesaplama, yıllık izin ve kıdem-ihbar hesaplamaları ile SGK teşviklerinin takibini yapıyoruz. İstihdam teşviklerini düzenli tarar, yararlanabileceğiniz indirimleri otomatik uygularız — çoğu işletme bordro maliyetini %10-15 düşürür.','bi-people','https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800&q=80',3),
('Vergi Danışmanlığı','vergi-danismanligi','Vergi yükünüzü yasal zeminde optimize eden planlama ve danışmanlık.','Vergi mevzuatındaki değişiklikleri sizin için takip ediyor, işletmenize özel vergi planlaması yapıyoruz. İndirim, istisna ve teşviklerden eksiksiz yararlanmanızı sağlıyor; vergi incelemesi ve uzlaşma süreçlerinde yanınızda duruyoruz. Yıl sonu gelmeden vergi projeksiyonu çıkararak sürprizleri önlüyoruz.','bi-percent','https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=800&q=80',4),
('Mali Tablo & Raporlama','mali-tablo-raporlama','Bilanço, gelir tablosu ve yönetim raporlarıyla net finansal fotoğraf.','Aylık ve yıllık mali tabloların hazırlanması, banka ve kredi başvuruları için finansal rapor düzenlenmesi, maliyet ve kârlılık analizleri yapıyoruz. Yönetim raporlarımız sade ve anlaşılırdır: hangi kaleminizin kâr getirdiğini, nereden tasarruf edebileceğinizi rakamlarla görürsünüz.','bi-graph-up-arrow','https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&q=80',5),
('Teşvik & Hibe Danışmanlığı','tesvik-hibe','KOSGEB, TÜBİTAK ve istihdam teşviklerinde başvurudan sonuca takip.','KOSGEB destekleri, genç girişimci teşviki, istihdam teşvikleri ve bölgesel yatırım desteklerinde uygunluk analizi yapıyor, başvuru dosyanızı hazırlıyor ve süreci sonuna kadar takip ediyoruz. Mevcut mükelleflerimizi yeni çıkan desteklerden proaktif olarak haberdar ederiz.','bi-cash-coin','https://images.unsplash.com/photo-1579621970563-ebec7560ff3e?w=800&q=80',6);

-- ============ PROJELER → SEKTÖRLER ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('E-Ticaret Firmaları','e-ticaret','Ticaret','https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&q=80','Pazaryeri komisyonları, kargo ve iade süreçleriyle e-ticarete özel muhasebe düzeni kuruyoruz.','60+ mükellef',1),
('Üretim & İmalat','uretim-imalat','Sanayi','https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800&q=80','Maliyet muhasebesi, stok takibi ve sanayi sicil işlemlerinde uzman destek.','40+ mükellef',2),
('Kafe & Restoran','kafe-restoran','Hizmet','https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800&q=80','Yazarkasa POS uyumu, günlük hasılat takibi ve personel devir hızına uygun bordro yönetimi.','50+ mükellef',3),
('İnşaat & Taahhüt','insaat-taahhut','Sanayi','https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800&q=80','Hakediş, taşeron ve yıllara sari iş muhasebesinde derin tecrübe.','30+ mükellef',4),
('Serbest Meslek','serbest-meslek','Hizmet','https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800&q=80','Doktor, avukat, mimar ve danışmanlar için serbest meslek defteri ve stopaj yönetimi.','80+ mükellef',5),
('Startup & Teknoloji','startup-teknoloji','Teknoloji','https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=800&q=80','Teknokent istisnaları, Ar-Ge teşvikleri ve yatırım turu süreçlerinde mali danışmanlık.','25+ mükellef',6);

-- ============ BLOG → MALİ REHBER ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('Şahıs Şirketi mi, Limited mi? Doğru Tercihin Rehberi','sahis-mi-limited-mi','Şirket Kuruluşu','Yeni girişimcilerin en sık sorduğu soru. Vergi, maliyet ve sorumluluk açısından karşılaştırdık.','Şahıs şirketi kuruluşu hızlı ve maliyetsizdir; gelir vergisi dilimlerine tabidir ve kazanç arttıkça vergi yükü artar. Limited şirkette kurumlar vergisi sabittir, ortağın sorumluluğu koyduğu sermayeyle sınırlıdır; ancak kuruluş ve kapanış maliyetleri daha yüksektir. Kabaca: yıllık kârınız belirli bir eşiğin altındaysa ve işiniz düşük riskliyse şahıs, büyüme ve kurumsal müşteri hedefiniz varsa limited genellikle daha avantajlıdır. En doğru karar ciro projeksiyonunuza göre verilir — ücretsiz ön görüşmede birlikte hesaplayalım.','https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=800&q=80','2026-05-22'),
('Genç Girişimci Vergi Teşviki: 3 Yıl Vergi Avantajı','genc-girisimci-tesviki','Teşvikler','29 yaş altındaysanız ve ilk kez şirket kuruyorsanız, önemli bir vergi istisnası sizi bekliyor.','Genç girişimci teşviki; ilk kez gelir vergisi mükellefi olan 29 yaşını doldurmamış girişimcilere, faaliyete başlanılan takvim yılından itibaren üç vergilendirme dönemi boyunca elde edilen kazancın belirli bir tutarına kadar gelir vergisi istisnası sağlar. Ayrıca bir yıl boyunca Bağ-Kur primleri devlet tarafından karşılanır. Teşvikten yararlanmak için kuruluş aşamasında doğru başvuruların yapılması şarttır — sonradan telafisi mümkün değildir. Kuruluş öncesi mutlaka danışın.','https://images.unsplash.com/photo-1556761175-b413da4baf72?w=800&q=80','2026-04-18'),
('E-Fatura ve E-Defter: Kimler İçin Zorunlu?','e-fatura-e-defter','E-Dönüşüm','E-dönüşüm kapsamı her yıl genişliyor. Cezayla karşılaşmadan geçiş yapmanın yol haritası.','Ciro eşiğini aşan mükellefler ile belirli sektörlerde faaliyet gösterenler (e-ticaret, aracı hizmet sağlayıcılar vb.) için e-fatura ve e-defter zorunludur. Kapsama girdiği halde geçiş yapmayan mükelleflere özel usulsüzlük cezaları uygulanır. Geçiş; mali mühür başvurusu, entegratör seçimi ve test süreçlerini içerir ve ortalama 2-3 hafta sürer. Mükelleflerimizin e-dönüşüm kapsamını her yıl başında otomatik kontrol ediyor, zorunluluk doğduğunda süreci bizden öğrenmeden tamamlıyoruz.','https://images.unsplash.com/photo-1554224154-26032ffc0d07?w=800&q=80','2026-03-10');

-- ============ REFERANSLAR (MÜKELLEF YORUMLARI) ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('Murat E.','E-Ticaret Firması Sahibi','5 yıldır birlikte çalışıyoruz, tek bir beyanname gecikmesi yaşamadık. Pazaryeri muhasebesini bilen müşavir bulmak zor — bu ekip işin içinde. Ayda bir gelen özet rapor sayesinde işimin fotoğrafını net görüyorum.','https://i.pravatar.cc/100?img=13',5),
('Selin A.','Mimarlık Ofisi','Şirket kuruluşumu 4 günde tamamladılar, genç girişimci teşvikine de onlar sayesinde girdim. Sorularıma aynı gün dönüş alıyorum; "müşavire ulaşamama" diye bir derdim hiç olmadı.','https://i.pravatar.cc/100?img=44',5),
('Kemal D.','İmalat Firması Genel Müdürü','SGK teşvik taramasıyla bordro maliyetimizi ciddi oranda düşürdüler. Vergi incelemesinde gösterdikleri hakimiyet ve duruş için ayrıca teşekkür ederim. Tam anlamıyla iş ortağı gibi çalışıyorlar.','https://i.pravatar.cc/100?img=53',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt) — CANLIDA MUTLAKA DEĞİŞTİR
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
