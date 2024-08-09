import 'package:intl/intl.dart';

const UMR = 2900000;

var numFormat = NumberFormat("#,000");
var dateFormat = DateFormat('yyyy-mm-dd');

abstract class karyawan{
  String npp=""; //not nullable
  String nama="";
  String? alamat; //nullable
  int thnMasuk;
  int _gaji = UMR;

  karyawan(this.npp, this.nama, {this.thnMasuk = 2015});
  
   void presensi(DateTime jamMasuk);
   String deskripsi(){
        String teks = """======================================
      NPP     : $npp
      Nama    : $nama
      Gaji    : ${numFormat.format(gaji)}
      """;
          if(alamat != null){
            teks += '\n Alamat  : $alamat';
          }
          return teks;
   }

   int get tunjangan;// {
    //if((2024- thnMasuk)< 5){
    //  return 5000000;
    //} else{
    //  return 10000000;
    //}
    //return((2024 - thnMasuk)<5)? 5000000 : 10000000;//ini untuk penganti if diatas
   //}

   //int get tunjsngan => ((2024 - thnMasuk) < 5) ? 5000000 : 10000000;//penyerdahanaan mengunakan arraw fungsion dari koding diatas
   int get gaji =>(_gaji + tunjangan);

   set gaji(int gaji){
      if(gaji < UMR){
        _gaji = UMR;
        print("Gaji tidak boleh di bawah UMR");
      } else{
        _gaji = gaji;
      }
   }
}

class stafBiasa extends karyawan{
  stafBiasa(super.npp, super.nama, {thnMasuk = 2015});
  @override
  void presensi(DateTime jamMasuk) {
    {
     if(jamMasuk.hour > 8){
      print("$nama pada ${dateFormat.format(jamMasuk)} Datang terlambat");
    } else{
      print("$nama pada ${dateFormat.format(jamMasuk)} Datang tepat waktu");
    }
   }
  }

  @override
  // TODO: implement tunjangan
  int get tunjangan => ((2024 - thnMasuk)<5)? 5000000 : 10000000;

}

enum TipeJabatan {kabang, manajer, direktur}

class Pejabat extends karyawan{
  TipeJabatan jabatan;

  Pejabat(super.npp, super.nama, this.jabatan,{thnMasuk = 2015});

  @override
  void presensi(DateTime jamMasuk) {
    {
    if(jamMasuk.hour > 10){
      print("$nama pada ${dateFormat.format(jamMasuk)} Datang terlambat");
    } else{
      print("$nama pada ${dateFormat.format(jamMasuk)} Datang tepat waktu");
    }
   }
  }

  @override
  int get tunjangan {
    if (jabatan == TipeJabatan.kabang){
      return 1500000;
    } else if(jabatan == TipeJabatan.manajer){
      return 2500000;
    } else{
      return 5000000;
    }
  }

  @override
  String deskripsi() {
    // TODO: implement deskripsi
    String teks = super.deskripsi();
    teks += "\n Jabatan  : ${jabatan.name}";
    return teks;
  }
}



//{
//    if(jamMasuk.hour > 8){
//      print("$nama Datang terlambat");
  //  } else{
    //  print("$nama Datang tepat waktu");
   // }
   //}