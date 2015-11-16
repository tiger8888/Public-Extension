//: [Table of Contents](Table%20of%20Contents)

extension CollectionType where
    Index == Int,
    Generator.Element.Index == Int,
    Generator.Element: CollectionType {

    // Performs an eager transpose of `self`. Uses `nil` as a placeholder, when transposing a jagged array
    func transpose() -> [[Generator.Element.Generator.Element?]] {
        guard let maxRowSize = maxElement({ $0.count < $1.count })?.count else { return [] }

        var result: [[Generator.Element.Generator.Element?]] = []
        result.reserveCapacity(maxRowSize)

        var currentColumnIndex = 0
        while currentColumnIndex < maxRowSize {
            var transposed: [Generator.Element.Generator.Element?] = []
            transposed.reserveCapacity(count)

            transposed.appendContentsOf(indices.map { index -> Generator.Element.Generator.Element? in
                currentColumnIndex < self[index].count ? self[index][currentColumnIndex] : nil
            })

            result.append(transposed)
            currentColumnIndex++
        }
        
        return result
    }
}