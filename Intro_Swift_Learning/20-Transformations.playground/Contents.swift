import UIKit
import Foundation

// MAP: Bir koleksiyon(collection - array, dictionarty, tuple vs.) üzerinde döngü oluşturmak ve koleksiyondaki her öğeye aynı işlemi uygulamak için kullanılabilir.

// MAP FONKSİYONU KULLANILMADAN ÖNCE BÖYLE BİR DÖNGÜYE KONULARAK YAPILIYORDU;
var cityNames = ["izmir", "ankara", "osmaniye", "adana", "istanbul", "sakarya"]
var newCities = [String]()

for city in cityNames {
    newCities.append(city.uppercased())
}
print(newCities)


// MAP FONKSİYONU İLE;
// map - Bu map fonksiyonu sayesinde döngülerden kurtulmuş olup sadece fonksiyonel programlama yaparak ilgili map fonksiyonunu çağırdık ve yukarıdaki işlemlerle aynı sonucu aldık.
let newCity = cityNames.map{$0.uppercased()}
print(newCity)


// flatMap: Flatmap, bir array içinde farklı array'ler varsa bunları tek dizide birleştirir.
var collections = [[1,2,3], [1,6,7],[34,6,9]]
let singletonCollection = collections.flatMap{$0} // Burdaki $0 aslında 0. satırı gösteriyor.
print(singletonCollection)

let squareCollection = collections.flatMap{$0.map{$0 * $0 }} // Burda ise 0. satırdaki arraylerin içerisinde tekrar map işlemi yaparak arraylar içerisindeki int değelerin karesi aldık.
print(squareCollection)


// compactMap - Compactmap map için nil ve olmayan değerlerini yok sayar ve yeni işlemi tamamlar.
let randomReturnedNames:[String?] = ["Steve", nil, "Bob", "Larrr", nil, "Halil", nil]
let validData = randomReturnedNames.compactMap{$0} // 0. satırdaki nil değerleri yok ettik.
print(validData) // Çıktı: ["Steve", "Bob", "Larrr", "Halil"]


// filter - Filter, fonksiyonu ile elimizdeki bir diziden istediğimiz koşula uyanları alabiliriz.
// Örneğin elemanları tamsayılar olan bir diziden çift veya tek sayıları ayırmak istediğimizde kullanabiliriz.
// Klasik Yöntemle;
let numbers = [1,2,3,4,5,6,7,8,9,10]
var evenNumbers = [Int]()

for number in numbers {

    if number % 2 == 0 {
        evenNumbers.append(number)
    }
}
print(evenNumbers)

// filter'ı kullanarak;
print(numbers.filter({$0 % 2 == 0})) // Burda mod alma işlemi yaptırdık. elemanları tamsayılar olan bir diziden çift veya tek sayıları ayırmak istediğimizde filter'ı kullandık.

// filter, kullanılarak arrayleri filtreledik.
let names = ["Caleb", "Steve", "Stanley", "Mark", "Max", "Elon", "Halilkrkn", "Seda"]
let filterNames = names.filter{ $0.first == "S"} // "S" harfi ile başlayan elemanları filtreledik ve o isimleri çektik.
print(filterNames)


// reduce - Reduce, fonksiyonu elimizdeki dizinin elemanlarından tek bir değer döndürür. Bunu şöyle bir senaryo da kullanabiliriz.
// Örneğin elemanları tamsayı olan bir dizinin elemanları toplamını/çarpımını yapmak isterseniz reduce fonksiyonunu kullanabilirsiniz.
let values = [3.0, 4.7, 12.65, 9.12, 187.9, 144]
let sum = values.reduce(2,+)  // Values içerisindeki herbir değere 2 ile toplayıp sonrada elemanların hepsini hepsini birbiriyle topladık.
let multi = values.reduce(1,*) // Values içerisindeki herbir değeri 1 ile çarpıp sonra tüm elemanların hepsini birbiriyle çarptık
let zero = values.reduce(0,*) // Sonuç Sıfır(0). Çünkü herbir değeri 0 ile çarptık ve sonrada tüm elemanları birbiri ile çarptık.
print(sum)
print(zero)

// reduce
let stringChunks = ["My name is ", "Halil and I", "am a developer", "."]
let sentence = stringChunks.reduce("Developer Bio: ", +) // cümleleri + işlemi sayesinde birleştirdi ve reduce içerisindeki ilk cümleyi de en başa ekledi.
print(sentence)



