# VPN Case Study

**A Flutter-based VPN UI prototype featuring MVVM architecture and GetX state management.**

---

## 🚀 Kurulum

1. **Depoları klonlayın**

   ```bash
   git clone https://github.com/mustafacaglarr/vpn_case_study.git
   cd vpn_case_study
   ```

2. **Flutter paketlerini yükleyin**

   ```bash
   flutter pub get
   ```

3. **Uygulamayı çalıştırın**

   * Emülatörde veya bağlı cihazda:

     ```bash
     flutter run
     ```
   * Belirli bir cihaza:

     ```bash
     flutter run -d <device_id>
     ```

---

## 📦 Proje Yapısı

```
lib/
├── core/
│   └── models/           # Country, ConnectionStats modelleri
├── data/
│   └── mock/             # Mock veriler (ülkeler, istatistikler)
├── presentation/
│   ├── home/
│   │   ├── view/         # HomeView ekranı
│   │   ├── viewmodel/    # HomeViewModel (GetX)
│   │   └── widgets/      # CountryCard, ConnectionStatsCard, HomeHeader
│   └── country_selection/
│       ├── view/         # CountrySelectionView
│       ├── viewmodel/    # CountrySelectionViewModel
│       └── widgets/      # CountrySelectionTile
├── shared/
│   └── widgets/          # BottomNavBar, constants.dart (renk/font sabitleri)
└── main.dart             # Uygulama başlangıç noktası
```

---

## 🏗️ Mimari Kararlar

* **MVVM (Model-View-ViewModel)**

  * `ViewModel` sınıfları UI bağımsız iş mantığını barındırır.
  * `View` (Widget) sadece görünüm ve kullanıcı etkileşimlerini yönetir.

* **GetX State Management**

  * Basit, reaktif `.obs` yapısı ile anlık UI güncellemeleri.
  * `Get.put` ve `Get.to` kolay bağımlılık yönetimi ve navigasyon.

* **Mock Veriler**

  * Gerçek bir VPN API’si yerine `data/mock/` altındaki örnek dataset kullanıldı.
  * Hız ve lokasyon verileri diyagramlar yerine basit model nesneleriyle simüle edildi.

* **Clean Code Prensipleri**

  * Tek sorumluluk: Her widget ve sınıfın net bir görevi var.
  * Sabitler (`constants.dart`) tek bir kaynaktan yönetiliyor.
  * Fonksiyonel ve okunabilir dosya yapısı.

---

## ⚙️ Kullanılan Üçüncü Parti Paketler

| Paket | Versiyon | Kullanım Amacı                                |   |   |
| ----- | -------- | --------------------------------------------- | - | - |
| `get` | ^4.7.2   | - State management (.obs, Rx)                 |   |   |
|       |          | - Basit navigasyon (`Get.to`, `Get.snackbar`) |   |   |
|       |          |                                               |   |   |

> **Not:** UI görselleri için Flutter’ın asset sistemi kullanıldı, ekstra network eklentisi gerekmedi.

---

## 📋 Kullanım

1. Ana ekranda **Countries** listesinden bir ülke seçin veya arama çubuğuna tıklayın.
2. **Ülke Seçim Ekranı**’nda liste veya arama ile ülke belirleyin.
3. Seçtiğiniz ülkeye bağlanmak için güç simgesine tıklayın (bağlantı süresi sıfırlanacak).
4. İndirme ve yükleme hızlarını ve bağlantı süresini üst kısımda gözlemleyin.

---

##
