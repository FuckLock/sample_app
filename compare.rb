require 'win32ole'

excel = WIN32OLE::new('excel.Application')
workbook = excel.Workbooks.Open('/Users/mac/Desktop/sheet1.xls')
worksheet = workbook.Worksheets(1) 
worksheet.Select


worksheet.Range('a1')['Value'] 
data = worksheet.Range('A1:D23286')['Value'] 

line = 1
while worksheet.Range("a#{line}")['Value']
   line=line+1


   line = '1'
data = []
while worksheet.Range("a#{line}")['Value']
   data << worksheet.Range("a#{line}:d#{line}")['Value']
   line.succ!
end



worksheet.Range('e2')['Value'] = Time.now.strftime '%d/%m/%Y' 
worksheet.Range('a5:c5')['Value'] = ['Test', '25', 'result'] 

excel.Run('SortByNumber')


worksheet.Range('a3:f5').Interior['ColorIndex'] = 36 
worksheet.Range('a3:f5').Interior['ColorIndex'] = -4142 
worksheet.Range('a3:f5').Interior['ColorIndex'] = ExcelConst::XlColorIndexNone

workbook.Close(1)

excel.Quit