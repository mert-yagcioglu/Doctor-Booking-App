import 'package:equatable/equatable.dart';

import 'doctor_address.dart';
import 'doctor_category.dart';
import 'doctor_package.dart';
import 'doctor_working_hours.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String bio;
  final String profileImageUrl;
  final DoctorCategory category;
  final DoctorAddress address;
  final List<DoctorPackage> packages;
  final List<DoctorWorkingHours> workingHours;
  final double rating;
  final int reviewCount;
  final int patientCount;

  const Doctor({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.workingHours,
    required this.category,
    required this.address,
    required this.packages,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.patientCount = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        bio,
        profileImageUrl,
        workingHours,
        category,
        address,
        packages,
        rating,
        reviewCount,
        patientCount,
      ];

  static final sampleDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. Aslı Eker',
      bio:
          'Lisans Eğitimimi Haliç Üniversitesi Psikoloji bölümünde tamamladım. Bu süreçte Anaokulu stajı, Bakırköy Ruh ve Sinir Hastalıkları Hastanesi Kronik Ruh Sağlığı Hastaları hasta gözlemi, Kamusal Başarı (Koçluk Eğitimi) projesinde yer aldım. Evli Çiftlerin Uyumu ile Feminizm Görüşleri Arasındaki İlişkinin Betimsel Olarak İncelenmesi, İlköğretim Düzeyindeki Öğrencilerin Sosyo Kültürel ve Ekonomik Degişkenlerini Göz önüne Alarak Hoşgörülülük Arasındaki İlişkinin incelenmesi projelerini gerçekleştirdim. Bu süreçte Kadın ve Aile Sağlığı Merkezlerin de Yetişkin ve Çocuk Psikoloğu olarak görev yaptım. Sonrasında Sosyal Hizmetler Çocuk Esirgeme Kurumu (Çocuk ve Gençlik Hizmetleri) İl Müdürlüğü’nde  Psikolog olarak çalıştım. Yüksek Lisansımı Arel Üniversitesi Psikoloji bölümünde tamamladım. Sonrasında bazı özel eğitim kurumlarında yönetici olarak görev aldım. Bu süreçte Biruni Üniversitesi Aile Danışmanlığı Sertifika Programına katılarak Aile Danışmanlığı Sertifikasını aldım.',
      profileImageUrl:
          'https://www.cvhero.com/img/ratgeber/lebenslauf/bewerbungsfoto-beispiel-frau-gut1.jpg',
      category: DoctorCategory.familyMedicine,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.0,
      reviewCount: 78,
      patientCount: 96,
    ),
    Doctor(
      id: '2',
      name: 'Dr. Tolga Korkmaz',
      bio: 'Üsküdar Üniversitesi İnsan ve Toplum Bilimleri Fakültesinde Psikoloji lisans eğitimini tamamladıktan sonra Üsküdar Üniversitesinde Klinik Psikoloji Yüksek Lisans eğitimini bitirmiştir. Uzmanlık sürecinde “NP İstanbul Beyin Hastanesinde” kazandığı deneyimlerin yanı sıra, çocuk, ergen ve yetişkin değerlendirme testleri, cinsel terapi ve aile yaşam süreçleri eğitimi ve klinik görüşmeler teknikleri eğitimlerini tamamlamıştır. Bunların haricinde, psikopatolojik vakalar, özel eğitim alan ve mental rahatsızlıkları olan bireyleri gördüğü stajları tamamlamış, şimdi ise kendi ofisinde online ve yüz yüze danışanlarını görmektedir. Uzmanlığı süresince tamamladığı dersler, - Davranışın Psikofizyolojik Temelleri - Bilişsel Davranışçı Tedaviler (BDT) - Aile Ve Çift Terapisi - Çocuk Psikopatolojisi - İleri Psikopatoloji - Psikopatoloji Ve Psikofarmakolojik Yaklaşımlar - Grup Psikoterapileri - Psikodiagnostik Testler - Klinik Süpervizyon',
      profileImageUrl:
          'https://www.cvhero.com/img/ratgeber/lebenslauf/bewerbungsfoto-beispiel-mann-gut1.jpg',
      category: DoctorCategory.emergencyMedicine,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.3,
      reviewCount: 52,
      patientCount: 85,
    ),
    Doctor(
      id: '3',
      name: 'Dr. Abdullah Karar',
      bio: '2019 yılında Acıbadem üniversitesi psikoloji bölümünden mezun oldum. 2020 yılında Biruni üniversitesinde 6 ay süren ‘’Aile Danışmanlığı’’ eğitimimi tamamladım. Bunun haricinde 2022 yılında Üsküdar üniversitesinde de ‘’Klinik Psikoloji’’ üzerine ve yine 2022 yılında Yıldız teknik üniversitesinde ‘’Psikolojik Danışmanlık ve Rehberlik’’ üzerine yüksek lisans eğitimlerimi tamamlayarak 2 farklı dalda master yaptım. Ayrıca aile ve çift danışmanlığı eğitimi, bilişsel davranışçı terapi eğitimi, kısa süreli çözüm odaklı terapi eğitimi, ölüm ve yas terapisi, Şema Terapi, Kabul ve Kararlılık Terapisi gibi farklı ekollerdeki terapi eğitimlerimi tamamladım. Meslek hayatımda 4 farklı kurumda stajyer psikolog olarak tecrübelerimi geliştirirken genelde yetişkinlerle çalıştım. Ergen ve yetişkinlerle 2 senedir kariyer psikolojik danışmanlığı ve bireyle psikolojik danışmanlık görüşmeleri yapıyorum.',
      profileImageUrl:
      'https://img.freepik.com/premium-photo/business-man-arms-crossed-work-portrait-with-career-confidence-smile-studio-happy-expert-male-professional-with-corporate-job-pride-employee-with-white-background-worker_590464-219229.jpg?w=360',
      category: DoctorCategory.cardiology,
      address: DoctorAddress.sampleAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.9,
      reviewCount: 74,
      patientCount: 91,
    ),
  ];
}
