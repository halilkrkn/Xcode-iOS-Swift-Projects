import UIKit

// ERROR HANDLING - HATA İŞLEME
/*
 Swift'de Hata İşleme Adımları
 1. Hata türlerini temsil eden bir numaralandırma oluşturun.
 2. Anahtar kelimeyi kullanarak bir fırlatma işlevi oluşturun throws.
 3. "try" Anahtar sözcüğü kullanarak işlevi çağırın .
 4. Kodu bloğa sarın ve tüm hataları işlemek için bloğu "try" ekleyin "do {...}.catch {...}"

 */

enum DivisionError: Error {
    
    case dividedByZero
}


// Fonksiyona bir throw özelliği getirdik. Yani hata fırlatmamıza olanak tanımamıza yarayan bir hata fırlatan fonksiyon (method-işlev) oluşturuldu..
// Bu sayede ilgili hataları fırlatabileceğiz.
// "throw" Anahtar kelimesi "return" anahtar kelimesi ile aynı etkiye sahiptir.
// "return" bir işlevden değer döndürürken "throw" ise hata değeri döndürür.
func division(numerator: Int, denominator: Int) throws {
    
    if denominator == 0 {
        throw DivisionError.dividedByZero
        
    } else {
        let result = numerator / denominator
        print("Result:", result)
        
    }
}

// Buradaki do-catch hatayı işliyor.
do {
//  Burdaki try da değerleri fırlatma(throws) işlevine iletmek için kullandık
    try division(numerator: 10, denominator: 0)
    print("Valid Division")
}

catch DivisionError.dividedByZero {
    print("Error: Denominator cannot be 0")
}
