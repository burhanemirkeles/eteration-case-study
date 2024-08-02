## Native Development Study Case:

Uygulama içerisinde en az 1 servis isteği yapılmalıdır.
Çalışma responsive design kurallarına uygun olarak yapılmalıdır.
Yapılacak çalışmada en az 3 ayrı sayfa olmalıdır.
Ürün Liste Sayfası
Ürün Detay Sayfası
Sepet Sayfası
Çalışma için Unit test yazılmalıdır.
MVVM architectural pattern kullanılması gerekmektedir.

#### iOS için:

    - Çalışma içinde yapılacak save / load işlemlerinin CoreData ile NotificationCenter kullanılması gerekmektedir.
    - Çalışmanın görsel tasarımı programmatic auto layout kullanılarak yazılmalıdır, snapKit vb. kullanılmamalıdır.
    - UIKit kullanılarak yazılmalıdır.
    - Servis istekleri için bir network manager yazılmalıdır.

#### Android için:

    - Çalışma içinde yapılacak save / load işlemlerinin Room kullanılması gerekmektedir.
    - Çalışmanın görsel tasarımı layout kullanılarak yazılmalıdır.
    - Kotlin teknolojisi kullanılmalıdır.
    - Servis istekleri Retrofit üzerinden yapılmalıdır.


## Çalışma için tamamlanması gereken işler

Uygulama, listeleme ekranı ile başlamalıdır.
Listenecek olan elemanlar [şu adres](https://5fc9346b2af77700165ae514.mockapi.io/products) üzerinden çekilip ekrana basılacaktır.
Ürünler 4’er adet olarak ekranda gösterilmelidir. 4’ten fazla ürün varsa infinite scroll özelliği eklenmelidir.
Listelenen ürünlerden biri seçildiğinde, o ürünün detaylarının bulunduğu ekrana yönlendirilecek ve ürün detayları gösterilecektir.
Ekranda bulunan “add to cart” butonuna basarak sepete ürün eklenmelidir.
Sepet Ekranında ürün sayısı arttırılıp azaltılabilmeli ve bu güncellemelere göre sepette güncellenmelidir.
Sepete eklenen ürünler, uygulama kapatılsa bile tekrar açıldığında kaldığı yerden devam edebilmelidir.
Ekranın sağ tarafında bulunan filtreler ile filtreleme işlemi yapılabilmelidir. Filtre ekranı modal presentation ile açılacaktır.
Anasayfa da bulunan “Search“ alanı ile tüm ürünler arasında isim ile arama yapılıp, aşağıdaki liste güncellenmelidir.
Ürünlerden herhangi birinin üzerine tıklandığında “Ürün Detay” ekranına gidebilmeli ve sepete ekleme işlemi bu alandan da yapılabilmelidir.

### Bonus:
Tabbar alanında sepette bulunan ürün sayısı gösteren badge olmalıdır.
Favori Sayfası ve ekle/çıkar özelliği.
Filtreler alanındaki "Search" işlemlerinin yapılması.
Çeşitli filtre tiplerinin eklenmesi.
Veriye bağlı ekranlarda no data case’i handle edilmesi.
Loading senaryolarının handle edilmesi.

#### API Link: https://5fc9346b2af77700165ae514.mockapi.io/products
#### Ekran Görselleri Link: https://www.figma.com/file/nxc84VSdrrf1tNoRcyDmvC/Eteration-React-Native-Case-Study

## Ekran Görselleri:

<img src="https://gitlab.eteration.com/academy/assignments/react-native-case-study/-/raw/main/docs/home.png" width="400"/>
<img src="https://gitlab.eteration.com/academy/assignments/react-native-case-study/-/raw/main/docs/detail.png" width="400"/>
<img src="https://gitlab.eteration.com/academy/assignments/react-native-case-study/-/raw/main/docs/cart.png" width="400"/>
