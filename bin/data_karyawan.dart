import 'package:data_karyawan/karyawan.dart';

void main(List<String> arguments){
//  karyawan staff1 = stafBiasa("A12050", "Rifqi Adi Pratama");
//  karyawan staff2 = stafBiasa("B1", "Kasper Lund", thnMasuk: 2015);

  List <karyawan> dataKaryawan = [];
  dataKaryawan.add(Pejabat("A12050", "Rifqi Adi Pratama", TipeJabatan.direktur));
  dataKaryawan.add(stafBiasa("B1", "Kasper Lund", thnMasuk: 2012));
  dataKaryawan[0].thnMasuk = 2012;

  dataKaryawan[0].presensi(DateTime.parse('2024-08-08 07:00:00'));
  dataKaryawan[1].presensi(DateTime.parse('2024-08-08 09:01:01'));

  // staff1.gaji= 500000;
  dataKaryawan[1].gaji= 5000000;

  dataKaryawan[0].alamat= "PAti";

  // print(staff1.deskripsi());
  // print(staff2.deskripsi());

  for (var staff in dataKaryawan) {
    print(staff.deskripsi());
  }
}
