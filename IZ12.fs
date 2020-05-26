open System

let list2Calc (input:list<string>) (list1:list<int>) =
    let rec findCount (input:list<string>) (elem:int) count =
        match input with
        |[] -> count
        |_ -> 
                try
                    if (Convert.ToInt32(input.Head) = elem) then
                       findCount input.Tail elem (count+1)
                    else
                        findCount input.Tail elem count
                with
                    | :? Exception -> findCount input.Tail elem count

    let rec finalOutput (input:list<string>) (list1:list<int>) =
        match list1 with
        |[] -> ()
        |_ -> 
                if((findCount input list1.Head 0) > 2) then
                    Console.Write(list1.Head.ToString() + "  ")
                finalOutput input list1.Tail
    finalOutput input list1

let list1Calc (input:list<string>)=
    let rec findRepeats (list:list<int>) (elem:int) =
        match list with
        | [] -> true
        | _ -> 
                if(list.Head = elem) then false
                else findRepeats list.Tail elem

    let rec uniqueElems (list1:list<int>) (textBoxCopy:list<string>) =
        match textBoxCopy with
        | [] -> list1
        | _ -> 
                try
                    if(findRepeats list1 (Convert.ToInt32(textBoxCopy.Head))) then 
                        uniqueElems (Convert.ToInt32(textBoxCopy.Head)::list1) textBoxCopy.Tail
                    else 
                        uniqueElems list1 textBoxCopy.Tail
                with
                    | :? Exception -> uniqueElems list1 textBoxCopy.Tail

    let rec reverse list =
        match list with
        |[] -> []
        |[x] -> [x]
        | head::tail -> reverse tail @ [head]

    let (list0:list<int>) = uniqueElems [] input
    let (list1:list<int>) = reverse list0
    list2Calc input list1
    ()

[<STAThread>]
[<EntryPoint>]
let main argv =
    Console.WriteLine("Введите начальную последовательность(каждый элемент через пробел)")
    let input = Seq.toList(Convert.ToString(Console.ReadLine()).Split ' ')
    Console.WriteLine("Элементы, которые встречались от 3-ех раз")
    list1Calc input
    Console.WriteLine("\nПрограмма закончила свою работу. Press any key to continue")
    Console.ReadKey()
    0 