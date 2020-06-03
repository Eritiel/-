open System
open System.Windows.Forms
open System.Drawing
open System.IO
open System.Text

let form = new Form(Width= 400, Height = 230, Text = "F# Главная форма", Menu = new MainMenu())

let start = new Button(Text = "Выполнить")
let input = new TextBox(Width = 340)
let result = new TextBox(Width = 340)
let label1 = new Label(Text = "Список:")
let label2 = new Label(Text = "Результат:")

start.Location <- new Point(147, 140)
input.Location <- new Point (20, 40)
result.Location <- new Point (20, 100)
label1.Location <- new Point (20, 20)
label2.Location <- new Point (20, 80)

form.Controls.Add(start)
form.Controls.Add(input)
form.Controls.Add(result)
form.Controls.Add(label1)
form.Controls.Add(label2)

let prime n =
    let rec isprime n m =
        if n=m then true
        else
            if n%m = 0 then false
            else isprime n (m+1)
    match n with
    |1->false
    |2->true
    |_ -> isprime n 2

let getPrimeDel el =
    let rec gD el d all=
        match d with
        |1 -> all
        |_ -> if el%d=0 && prime d then let n=all@[d]
                                        gD el (d-1) n
                                   else
                                        gD el (d-1) all
    gD el el []

let Click evArgs : unit =
    let read_data (text:string) =
        let rec parse listStr parsedText =
            match listStr with
            | h::t -> let number = Convert.ToInt32((string) h)
                      parse t (List.append parsedText [number])
            | [] -> parsedText

        parse (List.ofArray (text.Split(' '))) []

    let write_list (l) =
        let mutable gui_textOut = ""
        let _ = List.iter (fun x -> (gui_textOut <- gui_textOut + " " + x.ToString())) l
        result.Text<-gui_textOut

    let inputD = read_data input.Text
    write_list (List.filter (fun element -> List.forall (fun elem -> List.exists (fun el -> elem=el) inputD) (getPrimeDel element)) inputD)

start.Click.Add(Click)

Application.Run(form) 
