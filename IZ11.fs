open System
open System.IO
open System.Windows.Forms

let form = new Form()
let comboBox1 = new System.Windows.Forms.ComboBox()
let label1 = new System.Windows.Forms.Label()
let richTextBox1 = new System.Windows.Forms.RichTextBox()
let label2 = new System.Windows.Forms.Label()
// 
// comboBox1
// 
comboBox1.DropDownStyle <- System.Windows.Forms.ComboBoxStyle.DropDownList
comboBox1.FormattingEnabled <- true
comboBox1.Location <- new System.Drawing.Point(67, 56)
comboBox1.Name <- "comboBox1"
comboBox1.Size <- new System.Drawing.Size(223, 24)
comboBox1.TabIndex <- 0
// 
// label1
// 
label1.AutoSize <- true
label1.Location <- new System.Drawing.Point(64, 37)
label1.Name <- "label1"
label1.Size <- new System.Drawing.Size(115, 16)
label1.TabIndex <- 1
label1.Text <- "Выберите месяц"
// 
// richTextBox1
// 
richTextBox1.Location <- new System.Drawing.Point(67, 150)
richTextBox1.Name <- "richTextBox1"
richTextBox1.ReadOnly <- true
richTextBox1.Size <- new System.Drawing.Size(223, 60)
richTextBox1.TabIndex <- 2
richTextBox1.Text <- ""
// 
// label2
// 
label2.AutoSize <- true
label2.Location <- new System.Drawing.Point(64, 131)
label2.Name <- "label2"
label2.Size <- new System.Drawing.Size(85, 16)
label2.TabIndex <- 3
label2.Text <- "Время года:"
// 
// Form1
// 
form.AutoScaleDimensions <- new System.Drawing.SizeF(8.0F, 16.0F)
form.AutoScaleMode <- System.Windows.Forms.AutoScaleMode.Font
form.ClientSize <- new System.Drawing.Size(361, 281)
form.FormBorderStyle <- System.Windows.Forms.FormBorderStyle.FixedSingle
form.Margin <- new System.Windows.Forms.Padding(4, 4, 4, 4)
form.Name <- "Form1"
form.Text <- "Время года"


form.Controls.Add(label2)
form.Controls.Add(richTextBox1)
form.Controls.Add(label1)
form.Controls.Add(comboBox1)

comboBox1.Items.Add("Январь")
comboBox1.Items.Add("Февраль")
comboBox1.Items.Add("Март")
comboBox1.Items.Add("Апрель")
comboBox1.Items.Add("Май")
comboBox1.Items.Add("Июнь")
comboBox1.Items.Add("Июль")
comboBox1.Items.Add("Август")
comboBox1.Items.Add("Сентябрь")
comboBox1.Items.Add("Октябрь")
comboBox1.Items.Add("Ноябрь")
comboBox1.Items.Add("Декабрь")
comboBox1.SelectedIndex <- -1
let Change(e:EventArgs) = 
    if(comboBox1.SelectedIndex=0 || comboBox1.SelectedIndex=1 || comboBox1.SelectedIndex=11) then richTextBox1.Text <- "Зима"
    else
        if(comboBox1.SelectedIndex=2 || comboBox1.SelectedIndex=3 || comboBox1.SelectedIndex=4) then richTextBox1.Text <- "Весна"
        else
            if(comboBox1.SelectedIndex=5 || comboBox1.SelectedIndex=6 || comboBox1.SelectedIndex=7) then richTextBox1.Text <- "Лето"
            else
                richTextBox1.Text <- "Осень"
    ()

comboBox1.SelectedIndexChanged.Add(Change)

[<STAThread>]
[<EntryPoint>]
let main argv =
    do Application.Run(form)
    0