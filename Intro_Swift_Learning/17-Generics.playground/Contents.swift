import UIKit

// Generics Kullanımı ve Yöntemleri
// Generics, farklı veri türleriyle kullanılabilecek tek bir işlev ve sınıf (veya başka türler) oluşturmamıza olanak tanır.
// Kodumuzu yeniden kullanmamıza yardımcı olur.


// GENERIC FUNCTION
// Swift'de her türlü veri ile kullanılabilecek bir fonksiyon oluşturabiliriz.
// Böyle bir işlev, Generic Fonksiyon(İşlev) olarak bilinir.
// Fonksiyona iletilen değerin türüne bağlı olarak, T veri türü ( Int, String, vb.) ile değiştirilir.
// Buradaki T yerine herhangi bir isimlendirme de yapılabilir. T standart bir kullanım olduğu için kullanıldı.
func displayData<T>(data: T) {

    print("Generic Function:")
    print("Data Passed: ", data)
}


// Burada T yerine "Swift" stringini tanımladık fonksiyon içinde o stringi aldı yazdırdı. Mesela sonra 5 int değerini atadık ve o int değerini aldı ve yazdırdı.

let dissplayData: () = displayData(data: "Swift")
dissplayData

let dissplayData1: () = displayData(data: 5)
dissplayData1

//var dis = displayData(data: "Swift")
//dis


// GENERIC CLASS
// Generic Funtion'a benzer şekilde, herhangi bir veri türüyle kullanılabilecek bir sınıf da oluşturabiliriz.
//Böyle bir sınıf, Generic Class olarak bilinir


//create a generic class
class Information<T> {
    
    // property of T type - T tipinin özelliği
    var data: T
    
    
    init(data: T){
        self.data = data
    }

//    T tipi değişkeni döndüren Fonksiyon
    func getData() -> T {
        return self.data
    }
}

// initialize generic class with Int data - Generic Class'ı Int verisiyle Başlatma
var intInfo = Information<Int>(data: 26)
print("Generic Class Returns:", intInfo.getData())

// initialize generic class with String data - Generic Class'ı String verisiyle Başlatma
var strInfo = Information<String>(data: "Swift")
print("Generic Class Returns:", strInfo.getData())




// TYPE CONSTRAINTS IN SWIFT GENERICS - SWIFT GENERICS'TE TÜR KISITLAMALARI
// Genel olarak type(type) parametresi herhangi bir veri tipini ( Int, String, Double, ...) kabul edebilir.
// Ancak, yalnızca belirli türler için (sayı türlerinin verilerini kabul etmek gibi) generic kullanmak istiyorsak, Tür Kısıtlamalarını (Type Constraints) kullanabiliriz.

// Tür Kısıtlamaları (Type Constraints) olan Fonksiyon:
// Burada <T: Numeric>, type parametresine kısıtlamalar ekler. T'nin Sayısal protokole uyması gerektiğini tanımlar.
// Not: Numeric, Int ve Double gibi sayısal değerler için yerleşik protokoldür.
func addition<T: Numeric> (num1: T, num2: T) {
    
    print("Sum: ", num1 + num2)
}

// Int bir değer verdik ve fonksiyon içerisindeki değerlerde Int türünden oldu.
addition(num1: 5, num2: 10)

// Double bir değer verdik ve fonksiyon içerisindeki değerlerde Double türünden oldu.
addition(num1: 4.3, num2: 5.4)

/*
 GENERICS'IN AVANTAJLARI

 1. Code Reusability - Kod Yeniden Kullanılabilirliği

 - Generics'lerin yardımıyla farklı veri türleriyle çalışabilecek kodlar yazabiliriz.
 Örneğin:
 func genericFunction<T>(data: T) {...}
 
 - Burada generic bir fonksiyon oluşturduk. Bu aynı işlev, tamsayı verileri, dize verileri vb. üzerinde işlemler gerçekleştirmek için kullanılabilir.
 
 2. Used with Collections - Koleksiyonlarla Brilikte Kullanma
 
 - Array'ler generic kavramını kullanır.
 Örneğin;
 // creating a integer type array - Tamsayı(Int) türünde bir dizi(array) oluşturma
 var list1: Array<Int> = []

 // creating a string type array - String türünde bir dizi(Array) oluşturma
 var list2: Array<String> = []

 - Burada Int değerlerini tutan list1 dizisi(array)'dir ve String değerlerini tutan ise list2 dizisi(array)'dir.
 - Array'lere benzer şekilde Dictionary yapısıda Generic'tir.
 
 */
 


