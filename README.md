# ChatBot Başak – Yapay Zekâ Destekli Tarımsal Asistan

ChatBot Başak, çiftçilerin tarımsal sorularına akıllı yanıtlar veren bütün diller için geliştirilmiş bir yapay zeka destekli asistan uygulamasıdır. Projenin amacı, teknolojiyle tarımı buluşturarak çiftçilere zaman ve bilgi kazandırmaktır. Çiftçilerin tarım ürünleri, bitkiler ve sebzeler hakkında bilgiler ve hayvancılık alanında yardım etmek için yapılan bir projedir.

---

[Tanıtım Videosunu İzle](https://www.youtube.com/watch?v=CBq4J4ReHJU)  


[GitHub Projesi](https://github.com/AhmetBahr/Ai_Bot)

---

## 💡 Proje Yapısı

Bu proje iki ana bileşenden oluşur:

1. **Yapay Zekâ Altyapısı (AI)**
2. **Kullanıcı Arayüzü ve Uygulama Katmanı (GUI)**

---

## 1. Yapay Zekâ Altyapısı

ChatBot Başak, arkasında güçlü bir doğal dil işleme altyapısıyla çalışır:

### Özellikler:

- **Türkçe dil desteği:** GPT-3.5 altyapısına özel prompt mühendisliği ile istediğiniz dilde akıcı yanıtlar.
- **Alan uzmanlığı simülasyonu:** Chatbot, bir tarım mühendisi gibi davranacak şekilde yönlendirilmiştir.
- **Verimli promptlar:** Kullanıcı girdisi, sistem mesajları ve bağlam uyumlu promptlar ile optimize edilmiştir.
- **Yanıt doğruluğu:** Tarım, iklim, toprak, gübreleme gibi konularda anlamlı geri dönüşler sağlar.

### Kullanılan AI Teknolojileri:

- `OpenAI API` – GPT-3.5 modeli
- `Prompt Engineering` – Rol tanımlı konuşma
- `SpeechRecognition` – Mikrofon ile sesli sorgu imkânı
- `gTTS` / `pyttsx3` – Yanıtların sesli okunması

---

## 2. Uygulama ve Arayüz

Uygulama Flutter, dart dili kullanılarak yapılmıştır. Basit ve erişilebilir bir kullanıcı deneyimi sunar.

### Özellikler:

#### Canlı Chat Arayüzü
Kullanıcılar arayüz üzerinden doğal dilde sorular sorabilir, chatbot yanıtlarını metin veya sesli olarak alabilir.

![Chat Özelliği](assets/gif/writing.gif)

---

#### Sohbet Kaydetme
Kullanıcı ile chatbot arasındaki konuşma geçmişi, .txt formatında kolayca kaydedilebilir.

![Sohbet Kaydetme](assets/gif/save%20chat.gif)

---

#### Ana Ekran ve Basit Kullanım
Uygulamanın başlangıç ekranı, kullanıcıya anlaşılır bir giriş deneyimi sunar.

![Ana Ekran](assets/gif/main%20Screen.gif)

---

### Teknolojik Altyapı

- `Dart Dili`
- `Flutter` – GUI
- `OpenAI API` – AI yanıt motoru

---

## Kurulum

[Android APK İndir (v1.0)](https://github.com/AhmetBahr/Ai_Bot/tree/main/releases/download/v1.0)
