/*****************************************************************
Calculator program written in Swift

@author Steve Meadows
@version Winter 2022
*****************************************************************/

var num1: Float
var num2: Float
var keep_going = true
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
func exponentiate(x: Int32, y: Int32) -> Int32{
    let base = x
    var temp = x
    for _ in 1...(y-1){
        temp = temp * base
        print(x, temp)
    }
    return temp
}

func store(output: Any){
    memory.append(output)
}

func get_memory_size() -> Int{
    return memory.count
}

func get_memory_item(index: Int) -> Any {
    return memory[index-1]
}

func access_memory(){
    let check = get_memory_size()

    if (check < 1){
        print("You have nothing stored in memory. Lets calculate some shit!")
        calculator()
    }

    if (check == 1){
        print("You have \(get_memory_size()) calculations stored in memory.\n")
        print("Calculation stored at the 1st position is: \(get_memory_item(index: 1))")
    }
    if (check > 1){

        print("You have \(get_memory_size()) calculations stored in memory.\n")
        print("Which item would you like to view? (1-\(get_memory_size()))")
        let stored = readLine()
        var stored_as_int: Int
        stored_as_int = Int(stored!)!

        if (stored_as_int == 2){
            print("Calculation stored at the \(stored_as_int)nd position is: \(get_memory_item(index: stored_as_int)))")
        }
        if(stored_as_int > 2){
            print("Calculation stored at the \(stored_as_int)th position is: \(get_memory_item(index: stored_as_int)))")
        }
    }
}
    

func calculator(){
    // Product.init(items: Array<T>)

    print("Select operation.")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Exponentiate")

    while keep_going{
        // take input from the user
        print("Enter choice 1, 2, 3, 5 : ")
        let choice = readLine()

        // check if choice is one of the four options
        if (choice == "1") || (choice == "2") || (choice == "3") || (choice == "4") || (choice == "5"){

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

            if choice == "4"{
                var one: Float
                var two: Float

                one = Float(num1!)!
                two = Float(num2!)!

                store(output: divide(x: (one), y:(two)))
                print(one, "/", two, "=", divide(x: (one), y:(two)))
            }
            if choice == "5"{
                var one: Int32
                var two: Int32
                one = Int32(num1!)!
                two = Int32(num2!)!

                store(output: exponentiate(x: one, y: two))
                print("\(one)^\(two) =", exponentiate(x: (one), y:(two)))
            }
            
            // check if user wants another calculation
            // break the while loop if answer is no
            print("Let's do next calculation? (yes/no): ")

            let next_calculation = readLine()
            if next_calculation == "no"{

                print("Would you like to see what you've calculated? (yes/no): ")
                let view_memory = readLine()

                if (view_memory == "no"){
                keep_going = false
                break
                }
                if (view_memory == "yes"){
                    access_memory()
                }
            }
            if next_calculation == "yes"{
                calculator()
            }
            
            else{
                print("Invalid Input")
            }
        }
    }

}


calculator()