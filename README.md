#  TA Praktikum Teknik Kendali dan Otomasi - Kelompok 03

## Perancangan Sistem Kontrol Suhu Kabin Mobil Menggunakan PID Controller Berbasis Simulink

Project ini merupakan Tugas Akhir Praktikum Teknik Kendali dan Otomasi yang membahas mengenai perancangan dan simulasi sistem kontrol suhu kabin mobil menggunakan metode **Proportional-Integral-Derivative (PID) Controller** berbasis MATLAB/Simulink.

Sistem dirancang menggunakan konsep *closed-loop control* (sistem kendali tertutup) untuk mengatur dan mempertahankan suhu kabin agar mencapai *set-point* yang diinginkan secara stabil, cepat, dan presisi.

---

# 👥 Anggota Kelompok

| No | Nama Anggota | NIM |
|:--:|:---|:---|
| 1 | Dimas Agus Saputra | 21120123120038 |
| 2 | A Faidhullah Farros Basykailakh | 21120123140171 |
| 3 | Yudha Indra Praja | 21120123140143 |
| 4 | Batis Satriani Omar Ramadhan | 21120123120017 |
| 5 | Akmal Fadli Sifa | 21120123130083 |
| 6 | Fadhlan Yuqa Tahtadika | 21120123140147 |

---

# 📝 Latar Belakang

Kenyamanan suhu di dalam kabin mobil merupakan faktor krusial dalam pengalaman berkendara. Suhu kabin yang terlalu tinggi tidak hanya menyebabkan ketidaknyamanan bagi pengendara dan penumpang, tetapi juga dapat menurunkan tingkat konsentrasi pengemudi yang berpotensi membahayakan keselamatan.

Untuk mengatasi permasalahan tersebut, project ini mengimplementasikan sistem kontrol otomatis berbasis PID Controller. Sistem ini diprogram untuk merespons dinamika perubahan suhu luar dan menjaga agar suhu di dalam kabin tetap konstan dan stabil pada nilai kenyamanan ideal (*set-point*) yaitu **24°C**.

---

# 🎯 Tujuan Project

1. Merancang sistem kontrol suhu kabin mobil menggunakan PID Controller.
2. Mengimplementasikan desain sistem kendali lingkaran tertutup (*closed-loop system*) berbasis MATLAB/Simulink.
3. Memodelkan *plant* termal suhu kabin mobil ke dalam bentuk sistem linear orde pertama.
4. Melakukan *tuning* parameter PID ($K_p$, $K_i$, $K_d$) untuk mendapatkan respons terbaik.
5. Menganalisis respons transien sistem terhadap perubahan nilai parameter kendali.

---

# ⚙️ Metode yang Digunakan

## 1. Closed-Loop Control System
Sistem kendali lingkaran tertutup memanfaatkan umpan balik (*feedback*) yang diperoleh dari sensor suhu di dalam kabin untuk dibandingkan langsung dengan nilai acuan (*set-point*). Selisih nilai tersebut menghasilkan nilai error yang akan terus dikoreksi oleh kontroler.

## 2. PID Controller
Kontroler PID mengombinasikan tiga aksi evaluasi error:

* **Proportional ($K_p$):** Mengurangi *rise time* tetapi menyisakan *steady-state error*.
* **Integral ($K_i$):** Menghilangkan *steady-state error* namun dapat meningkatkan *overshoot*.
* **Derivative ($K_d$):** Meredam osilasi dan meningkatkan stabilitas sistem.

## 3. Plant Model
Dinamika termal suhu kabin mobil dimodelkan menggunakan fungsi alih (*transfer function*) orde pertama sebagai berikut:

$$
G(s) = \frac{1}{100s + 1}
$$

---

# 📈 Parameter & Konfigurasi Sistem

## Parameter PID Terbaik

Berdasarkan hasil pengujian dan *tuning*, kombinasi parameter PID terbaik yang diperoleh adalah:

| Parameter | Simbol | Nilai |
|:---|:---:|:---:|
| Proportional | $K_p$ | 4.0 |
| Integral | $K_i$ | 0.2 |
| Derivative | $K_d$ | 4.0 |

---

## Konfigurasi Plant State-Space

Model ruang keadaan (*State-Space*) dari plant diatur dengan parameter berikut:

| Parameter | Nilai |
|:---|:---:|
| **A** | -0.01 |
| **B** | 0.01 |
| **C** | 1 |
| **D** | 0 |
| **Initial Condition (Suhu Awal)** | 30°C |

---

# 📊 Hasil Simulasi

Hasil pengujian pada Scope Simulink menunjukkan performa sistem kendali sebagai berikut:

* **Aksi Penurunan Suhu:** Sistem berhasil menurunkan suhu kabin dari suhu awal $30^\circ\text{C}$ menuju target $24^\circ\text{C}$.
* **Stabilitas:** Respons transien sistem cukup stabil menuju keadaan tunak (*steady state*).
* **Steady-State Error ($e_{ss}$):** Galat keadaan tunak bernilai mendekati nol.
* **Undershoot:** Terjadi sedikit fenomena *undershoot* pada fase awal transien.
* **Settling Time ($t_s$):** Waktu yang dibutuhkan sistem untuk mencapai kondisi stabil berada pada rentang **80–100 detik**.

---

# 🛠️ Tools dan Software

* MATLAB
* Simulink

---

# 📁 Struktur Repository

```text
TA-TKO-Kel03/
│
├── simulasi_pid_kabin.slx   # File model simulasi Simulink
├── pid_controller.m         # Script MATLAB untuk inisialisasi / tuning parameter
└── README.md                # Dokumentasi project
