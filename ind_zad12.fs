open System


let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    read_list n

let rec findCount input elem (count:int) =  
    match input with
    |[] -> count
    |head::tail ->  if (head = elem) then
                        if(count=2) then    
                            (count+1)       
                        else                
                            findCount tail elem (count+1) 
                    else 
                        findCount tail elem count 

let findUnique input =
    let rec isNoRepeats (uniques:list<int>) (elem:int) =
        match uniques with 
        |[]-> true 
        |head::tail-> if(head = elem) then false 
                      else isNoRepeats tail elem 
                           
    let rec fU (input:list<int>) uniques = 
        match input with
        |[]-> uniques   
        |head::tail ->  if(isNoRepeats uniques head) then
                            fU tail (uniques@[head])
                        else
                            fU tail uniques 

    let rec output (unique:list<int>) = 
        match unique with
        |[] -> ()
        |head::tail -> if ((findCount input head 0) = 3) then Console.Write(head.ToString() + "  ")
                       output tail
    
    output (fU input [])
    
[<EntryPoint>]
let main argv =
    let input = read_data
    Console.WriteLine "Элементы, встречающиеся более трёх раз\n"
    findUnique input
    Console.ReadKey()
    0
