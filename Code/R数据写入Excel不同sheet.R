### Method1 xlsx包
# library(rJava)
# library(xlsxjars)
# library(xlsx)
# 
# df1 <- data.frame(x = 1:10, y = LETTERS[1:10])
# df2 <- data.frame(x = 2:11, y = LETTERS[2:11])
# df3 <- data.frame(x = 3:12, y = LETTERS[3:12])
# 
# write.xlsx(df1, file="file1.xlsx", sheetName="sheet1", row.names=FALSE)
# write.xlsx(df2, file="file1.xlsx", sheetName="sheet2", append=TRUE, row.names=FALSE)     #append用于追加不同sheet
# write.xlsx(df3, file="file1.xlsx", sheetName="sheet3", append=TRUE, row.names=FALSE)     #append用于追加不同sheet

### Method2 openxlsx包
# library(openxlsx)
# list_data <- list("Sheet1" = df1, "Sheet2" = df2)
# write.xlsx(list_data, file = "****\\file2.xlsx")


### Method3 openxlsx包
# 安装openxlsx包，环境设置应该就是确保装包过程顺利吧！继续利用openxlsx包，需要先穿件空工作簿（createworkbook），再创建sheet（createSheet），然后向对应sheet写入数据。这种方法的缺点在于：需要一个一个将数据装载进对应sheet，对码控党比较糟心，代码量太长，不如Method2。还是上代码玩玩吧！
wb = createWorkbook()     #创建空worksheet
sheet1 = createSheet(wb,"Sheet1")  #创建装载数据的sheet
addDataFrame(df1, sheet=sheet1,startColumn=1,row.names=FALSE) #向对应sheet中写入数据
sheet2 = createSheet(wb, "Sheet2")
addDataFrame(df2, sheet=sheet2, startColumn=1, row.names=FALSE)
saveWorkbook(wb, "File3.xlsx")     #保存文件


### Method4 writexl包
# library(writexl)
# sheets <- list("sheet1" = df1, "sheet2" = df2) #载入数据为data frame
# write_xlsx(sheets, "file4.xlsx")