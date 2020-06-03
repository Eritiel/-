open System

let rec izbitok n div sum=
    if (div > (n/2)) then
        if (sum > n) then 
            //Console.Write(n.ToString() + "  ")
            true
        else
            false
    else
        if (n % div = 0) then izbitok n (div+1) (sum+div)
        else izbitok n (div+1) (sum)

let memo = ref Map.empty

let rec perebor n =
    if(Map.containsKey n !memo) then
        Console.Write(n.ToString() + "  ")
        true
    else
        if(izbitok n 1 0) then
            memo := Map.add n n !memo
            true
        else
            false
let callFirstRun =
    let rec firstRun n count =
        if (n < 20000) then
            if(perebor n) then
                firstRun (n+1) (count+1)
            else
                firstRun (n+1) count
        else
            count
    firstRun 1 0

let rec compare (n:int) (current:int)=
    if(n >= (current-n)) then         
        true
    else
        if((Map.containsKey (n) !memo) && (Map.containsKey (current-n) !memo)) then
            false
        else
            compare (n+1) current

let callFinalCalc current limit = 
    let rec finalCalc current limit result =
        if (current < limit) then
            Console.WriteLine(current.ToString())
            if (compare 1 current) then 
                finalCalc (current+1) limit (result+1)
            else
                finalCalc (current+1) limit result
        else
            Console.WriteLine(result)
    finalCalc current limit 0

[<EntryPoint>]
let main argv =
    callFirstRun
    callFinalCalc 1 20000
    Console.ReadKey() |>ignore
    0