import Foundation

extension Date {
  private static var dateOnlyTimeZone: TimeZone?

  public static func setDateOnlyTimeZone(_ timeZone: TimeZone?) {
    dateOnlyTimeZone = timeZone
  }

  func dateOnly(calendar: Calendar) -> Date {
    let yearComponent = calendar.component(.year, from: self)
    let monthComponent = calendar.component(.month, from: self)
    let dayComponent = calendar.component(.day, from: self)
    let zone = Date.dateOnlyTimeZone ?? calendar.timeZone

    let newComponents = DateComponents(timeZone: zone,
                                       year: yearComponent,
                                       month: monthComponent,
                                       day: dayComponent)
    let returnValue = calendar.date(from: newComponents)
    return returnValue!
  }
}
