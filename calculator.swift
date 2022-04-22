/*****************************************************************
Calculator program written in Swift

@author Steve Meadows
@version Winter 2022
*****************************************************************/

// first number for all calculations
var num1: Float

// second number for all calculations
var num2: Float

// boolean that tells the main calculator function to continue
var keep_going = true

// array holding all calculations
var memory : [Any] = []

// This function adds two numbers
func add(x: Float, y: Float) -> Float{
    return x + y
}

// This function subtracts two numbers
func subtract(x: Float, y: Float) -> Float {
    return x - y
}
// This function multiplies two numbers
func multiply(x: Float, y: Float) -> Float {
    return x * y
}

// This function divides two numbers
func divide(x: Float, y: Float) -> Float{
    return x / y
}

// This function takes a base number and an n and
// raises the base to the nth power.
func exponentiate(x: Float, y: Float) -> Float{
    if(y == 0){
        return 1
    }
    if(y == 1){
        return x
    }
    else{
        let range : Int
        range = Int(y)
        let base = x
        var temp = x
        for _ in 1...(range-1){
            temp = temp * base
        }
        return temp
    }
}

// function stores calculation in memory
func store(output: Any){
    memory.append(output)
}

// function returns the size of memory array
func get_memory_size() -> Int{
    return memory.count
}

// function returns an element at the given index
func get_memory_item(index: Int) -> Any {
    return memory[index-1]
}

// function allows access to memory
func access_memory(){
    let check = get_memory_size()

    if (check < 1){
        print("You have nothing stored in memory. Lets calculate some shit!")
        print("")
        calculator()
    }

    if (check == 1){
        print("You have \(get_memory_size()) calculations stored in memory.\n")
        print("Your 1st calculation was: \(get_memory_item(index: 1))")
    }
    if (check > 1){

        print("You have \(get_memory_size()) calculations stored in memory.\n")
        print("Which item would you like to view? (1-\(get_memory_size()))")
        let stored = readLine()
        var stored_as_int: Int
        stored_as_int = Int(stored!)!

        if (stored_as_int == 1){
            print("Your 1st calculation was: \(get_memory_item(index: 1))")        
        }
        if (stored_as_int == 2){
            print("Your \(stored_as_int)nd calculation was: \(get_memory_item(index: stored_as_int))")
        }
        if(stored_as_int > 2){
            print("Your \(stored_as_int)th calculation was: \(get_memory_item(index: stored_as_int))")
        }
    }
    calculator()
}
    
// main calculator function. Takes two numbers and calculates. Each time the calculator
// performs an arithmatic function, the result is stored.
func calculator(){

    print("Select operation.")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Exponentiate")
    print("6. Check Calculator Memory")
    print("7. Quit")
    print("")

    while keep_going{

        // take input from the user
        print("Enter choice 1, 2, 3, 4, 5, 6, 7: ")
        let choice = readLine()

        // press 6 to access memory
        if (choice == "6"){
            access_memory()
        }

        //press 7 to quit
        if (choice == "7"){
            keep_going = false
            break
        }

        // press 1-5 to calculate
        if (choice == "1") || (choice == "2") || (choice == "3") || (choice == "4") || (choice == "5") {

                print("Enter first number: ")
                let num1 = readLine()
                print("Enter second number: ")
                let num2 = readLine()

            if choice == "1"{
                var one: Float
                var two: Float

                one = Float(num1!)!
                two = Float(num2!)!

                store(output: add(x: (one), y:(two)))
                print(one, "+", two, "=", add(x: (one), y:(two))) 
            }
            if choice == "2"{
                var one: Float
                var two: Float

                one = Float(num1!)!
                two = Float(num2!)!
                
                store(output: subtract(x: (one), y:(two)))
                print(one, "-", two, "=", subtract(x: (one), y:(two)))
            
            }
            if choice == "3"{
                var one: Float
                var two: Float

                one = Float(num1!)!
                two = Float(num2!)!

                store(output: multiply(x: (one), y:(two)))
                print(one, "*", two, "=", multiply(x: (one), y:(two)))
            }

            if choice == "4" && num2 != "0"{
                var one: Float
                var two: Float

                one = Float(num1!)!
                two = Float(num2!)!

                store(output: divide(x: (one), y:(two)))
                print(one, "/", two, "=", divide(x: (one), y:(two)))
            }
            if choice == "4" && num2 == "0"{
                print("Can't divide by 0. Let's try again, shall we?")
                calculator()
            }
            if choice == "5"{
                var one: Float
                var two: Float
                one = Float(num1!)!
                two = Float(num2!)!

                store(output: exponentiate(x: one, y: two))
                print("\(one)^\(two) =", exponentiate(x: (one), y:(two)))
            }
            
            // check if user wants another calculation
            // break the while loop if answer is no
            print("")
            print("Let's do next calculation? (yes/no): ")
            let next_calculation = readLine()
            print("")
            if next_calculation == "no"{
                keep_going = false
                print("Would you like to see what you've calculated? (yes/no): ")
                let view_memory = readLine()

                if (view_memory == "no"){
                    keep_going = false
                    break
                }
                if (view_memory == "yes"){
                    keep_going = true
                    access_memory()
                }
            }
            if next_calculation == "yes"{
                calculator()
            }
        }
    }
}
// Main calculator function call
calculator()