/*: [Previous](@previous)                                   [Home](Introduction)                                        [Next](@next)*/

/*: # `self` vs `Self` in Swift Programming
In Swift, self and Self (with a capital 'S') play distinct roles in object-oriented and protocol-oriented programming. They are crucial keywords that ensure clarity, type safety, and facilitate various coding patterns. Let’s dive into their meanings, differences, and practical applications
*/

//## `self`
//`self` refers to the current instance (object) of a class or struct. It is used to distinguish instance variables or methods from local variables or parameters.

//## `Self`
//`Self` (with a capital 'S') refers to the current type itself. It is particularly useful in protocols and generic contexts to ensure type safety and clarity.

//: # Example
class Person {
    private var name: String
    private var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // Using `self` to update age
    func updateAgeWithExactClassType(age: Int) -> Person {
        self.age = age
        return self
    }
    
    // Using `Self` to return exact type
    func updateAgeWithSelfKeyword(age: Int) -> Self {
        self.age = age
        return self
    }
}

let person = Person(name: "vinay", age: 26)

// Example of using `self` to update age
person.updateAgeWithExactClassType(age: 30)

// Example of using `Self` to return exact type
person.updateAgeWithSelfKeyword(age: 40)

//: ## `self`
//In the `Person` class example above, `self` is used to refer to the current instance of the class when accessing its properties or methods. Which uses to differ method parameters from instance variables

//: ## `Self`
//: The `updateAgeWithSelfKeyword` method uses `Self` as its return type. This allows the method to return an instance of the same class type (`Person`) or its subclass dynamically, which is useful for method chaining and adhering to the builder pattern.

//: # Benefits of `Self` over exact Class `Person` as return type
//: ### Drawbacks of `updateAgeWithExactClassType`
//: The `updateAgeWithExactClassType` method explicitly returns `Person`, which limits its usage when subclassing `Person`. If you subclass `Person`, you cannot override this method to return instances of the subclass without changing its return type.

//: ### Advantages of `updateAgeWithSelfKeyword`
//: The `updateAgeWithSelfKeyword` method uses `Self` as its return type. This means it dynamically resolves to the type of the current instance (`Person` or its subclass). You can override this method in subclasses and have it return instances of those subclasses, maintaining type safety and adhering to the builder pattern.

//: To understand more let's change the code snippet a little bit.
class AdvancedPerson: Person {
    
    func extraFunctionality() {
        print("person has super power like avengers")
    }
    
    override func updateAgeWithExactClassType(age: Int) -> Person {
        // some code
        return self
    }
    
    override func updateAgeWithSelfKeyword(age: Int) -> Self {
        // some code
        return self
    }
}

let advancedPerson = AdvancedPerson(name: "IronMan", age: 40)
advancedPerson.updateAgeWithExactClassType(age: 50)
advancedPerson.updateAgeWithSelfKeyword(age: 50)

/*:
 1. `updateAgeWithExactClassType` returns `Person` as a type which won't have functionalities of the sub-class `AdvancedPerson` we can't be chaining to access methods of the `AdvancedPerson` class.
 2. `updateAgeWithSelfKeyword` returns `Self` on runtime Swift knows what type should return so that we can access of existing functionalities of the sub-class `AdvancedPerson`
*/

//: # Use of `Self` with protocols
protocol Address {
    func addAddress(address: String) -> Self
}

class PersonWithAddress: Person, Address {
    private var address: String?
    
    func addAddress(address: String) -> Self {
        self.address = address
        return self
    }
}

let personWithAddress = PersonWithAddress(name: "vinay", age: 26)

// Example of using `Self` in protocol conformance
personWithAddress.addAddress(address: "India")

//: # Benefits
//: ## `self`
//: * **Clarity:** Helps distinguish between instance properties and local variables or parameters within methods.
//: * **Avoiding Name Conflicts:** Ensures clear referencing of instance properties and methods.

//: ## `Self`
//: * **Type Safety:** Guarantees that protocols and generics return or reference the exact type of the conforming or implementing instance.
//: * **Flexibility:** Supports method chaining and builder pattern, improving code readability and maintainability. Using `Self` allows for returning the exact type without explicitly specifying it, promoting easier code maintenance and adaptation.

//: # Conclusion
//: Understanding the distinctions between `self` and `Self` is crucial for writing clear, type-safe, and maintainable Swift code. While `self` refers to the current instance, `Self` ensures consistency in types within protocols and generics. Leveraging these keywords effectively enhances your ability to design robust Swift solutions.

//: > `self` -> Refers to the current instance (object).
//: > `Self` -> Refers to the type itself, ensuring type safety and clarity. It simplifies method chaining and conforms to protocols in a flexible manner, improving code maintainability.
