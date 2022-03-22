import UIKit

// ACCESS CONTROL - ERİŞİM KONTROLÜ
// Sınıfların, yapıların, numaralandırmaların, özelliklerin, yöntemlerin, başlatıcıların ve alt simgelerin erişilebilirliğini (görünürlüğünü) ayarlamak için erişim kontrolleri kullanılır.

// Type of Access Control - Erişim Kontrolü Erişimi
// Dört çeşit erişim kontrolü vardır: public, private, fileprivate, internal

// public: Bildirimlere her yerden erilebilir.
// private: Bildirimlere yalnızca tanımlanan sınıf veya yapı içinde erişilebilir.
// fileprivate: Bildirimlere yalnızca geçerli Swift dosyası içinde erişilebilir.
// internal: Bildirimlere yalnızca tanımlanan modül içerisinde erişilebilir.(varsayılan)


// PUBLIC ACCESS CONTROL - PUBLIC(GENEL) ERİŞİM KONTROLÜ
class Animal {
   
//     public property
    public var legCount: Int = 0
    
//    public method
    public func display() {
        print("I am an animal.")
        print("Total Legs:", legCount)
    }

}

var animal = Animal()
//access and assign value to public property
animal.legCount = 4
// access the public method
animal.display()

// PRIVATE ACCESS CONTROL - PRIVATE(ÖZEL) ERİŞİM KONTROLÜ
// Student içerisindeki özellikler ve methodlar private olduğu için dışarıdan erişilemez.
// Sadece Student Sınıfı içerisinden erişilebilir.
class Student {

  // private property
  private var name = "Tim Cook"

  // private method
  private func display() {
    print("Hello from Student class")
  }
}

// create object of Student class
var student1 = Student()
    
// access name property
//print("Name:", student1.name)

// access display() method
//student1.display()

// Aşağıdaki gibi bir hata ile Karşılaşılır.
//error: 'name' is inaccessible due to 'private' protection level
//error: 'display' is inaccessible due to 'private' protection level


// FILEPRIVATE ACCESS CONTROL - FILEPRIVATE(ÖZEL DOSYA) ERİŞİM KONTROLÜ
//Not : Başka bir Swift dosyası oluşturup data üyelerine erişmeye çalışırsak fileprivatehata alırız.
class School {

  // fileprivate property
  fileprivate var name = "Tim Cook"

  // fileprivate method
  fileprivate func display() {
    print("Hello from School class")
  }
}

// create object of School class
var school = School()
    
// access name property
print("Name:", school.name)

// access display method
school.display()

// INTERNAL ACCESS CONTROL - INTERNAL(DAHİLİ) ERİŞİM KONTROLÜ
// Bir type veya type üyesini dahili olarak tanımladığımızda sadece aynı modül içerisinden erişilebilir.
// Bir Modül, türlerin (sınıflar, protokoller, vb.) ve kaynakların (verilerin) bir koleksiyonudur. Birlikte çalışmak ve mantıksal bir işlevsellik birimi oluşturmak üzere inşa edilmişlerdir.
class Car {

  // define internal property
  internal var name = "BMW"
}

// create object of Student class
var car = Car()
  
// access name property
print("Name:", car.name)

// Tek bir modül içinde internal kullanırsak, genel(public) erişim değiştiricisi gibi çalışır.
// Not: Başka bir modül oluşturur ve dahili veri üyelerine erişmeye çalışırsak bir hata alırız.

